# Emilio Mendoza Palafox - A00344575
# Proyecto final TC1028

import sys
import random
from PySide2.QtWidgets import (QApplication, QLabel, QPushButton,
                               QVBoxLayout, QWidget, QStackedLayout, QLineEdit, QTableView)
from PySide2.QtCore import Slot, Qt, QTimer

class MathGame(QWidget):
    def __init__(self):
        """
        Clase principal. Genera widgets y los acomoda en layouts
        """
        super().__init__()
        
        self.layout = QVBoxLayout()
        self.setLayout(self.layout)

        self.title_text = "Learn math!"

        self.setWindowTitle(self.title_text)

        #######################################################################

        self.main_widget = QWidget()
        self.layout.addWidget(self.main_widget)
        self.main_widget_layout = QVBoxLayout()
        self.main_widget.setLayout(self.main_widget_layout)

        self.main_title = QLabel(f"<font size=40>{self.title_text}</font>")
        self.easy_btn   = QPushButton("Easy")
        self.inter_btn  = QPushButton("Intermediate")
        self.hard_btn   = QPushButton("Hard")

        self.easy_btn.setStyleSheet("color: #238823");
        self.inter_btn.setStyleSheet("color: #EBB000");
        self.hard_btn.setStyleSheet("color: #D2222D");

        self.main_widget_layout.addWidget(self.main_title, 0, Qt.AlignCenter)
        self.main_widget_layout.addWidget(self.easy_btn, 0, Qt.AlignCenter)
        self.main_widget_layout.addWidget(self.inter_btn, 0, Qt.AlignCenter)
        self.main_widget_layout.addWidget(self.hard_btn, 0, Qt.AlignCenter)

        #######################################################################

        self.game_widget = QWidget()
        self.layout.addWidget(self.game_widget)
        self.game_widget_layout = QVBoxLayout()
        self.game_widget.setLayout(self.game_widget_layout)

        self.game_timer = QTimer()
        self.game_title = QLabel(f"")
        self.pts_title  = QLabel(f"")
        self.prompt     = QLabel("<font size=16>Resuelve lo siguiente:</font>")
        self.question   = QLabel()
        self.text_input = QLineEdit()
        self.next_btn   = QPushButton("Next")

        self.time_remaining = 0
        self.answer = ""
        self.game_timer.timeout.connect(self.timeout)  

        self.game_widget_layout.addWidget(self.game_title, 0, Qt.AlignCenter)
        self.game_widget_layout.addWidget(self.pts_title,  0, Qt.AlignCenter)
        self.game_widget_layout.addWidget(self.prompt,     0, Qt.AlignCenter)
        self.game_widget_layout.addWidget(self.question,   0, Qt.AlignCenter)
        self.game_widget_layout.addWidget(self.text_input, 0, Qt.AlignCenter)
        self.game_widget_layout.addWidget(self.next_btn,   0, Qt.AlignCenter)

        #######################################################################

        self.leaderboard_widget = QWidget()
        self.layout.addWidget(self.leaderboard_widget)
        self.leaderboard_widget_layout = QVBoxLayout()
        self.leaderboard_widget.setLayout(self.leaderboard_widget_layout)

        self.result     = QLabel()
        self.again_btn  = QPushButton("Try again?")

        self.leaderboard_widget_layout.addWidget(self.result, 0, Qt.AlignCenter)
        self.leaderboard_widget_layout.addWidget(self.again_btn, 0, Qt.AlignCenter)
        
        #######################################################################

        self.easy_btn.clicked.connect(self.start_easy)
        self.inter_btn.clicked.connect(self.start_inter)
        self.hard_btn.clicked.connect(self.start_hard)
        self.next_btn.clicked.connect(self.next_question)
        self.text_input.returnPressed.connect(self.next_question)
        self.again_btn.clicked.connect(self.restart)

        self.main_widget.setVisible(True)
        self.game_widget.setVisible(False)
        self.leaderboard_widget.setVisible(False)

        self.easy_questions = self.generate_easy()
        self.inter_questions = self.generate_inter()
        self.hard_questions = self.generate_hard()
    

    def restart(self): 
        """
        Reinicia el juego
        """ 
        self.main_widget.setVisible(True)
        self.game_widget.setVisible(False)
        self.leaderboard_widget.setVisible(False)
        self.points = 0
        self.answer = ""

    def timeout(self):
        """
        Maneja actualizaciones del reloj, checa si el tiempo se acabó
        """
        self.time_remaining -= 1
        self.game_title.setText(f"<font size=20>Tiempo restante: <font color=red>{self.time_remaining/10}</font> segundos</font>")

        if self.time_remaining <= 0:
            self.game_timer.stop()
            self.game_widget.setVisible(False)
            self.leaderboard_widget.setVisible(True)
            if self.points > 0:
                self.result.setText(f"<font size=20>¡Muy bien! Obtuviste {self.points} puntos!</font>")
            else:
                self.result.setText(f"<font size=20>¡Oh no! Solo obtuviste {self.points} puntos!</font>")


    def start_game(self):
        """
        Inicializa puntaje y timer, muestra siguiente interfaz y deja todo inicializado
        """
        self.time_remaining = 600
        self.points = -1
        self.main_widget.setVisible(False)
        self.leaderboard_widget.setVisible(False)
        self.game_widget.setVisible(True)
        self.game_timer.start(1e2)
        self.text_input.clear()
        self.timeout()
        self.next_question()

    def generate_easy(self):
        """
        Genera ecuaciones del tipo a + b = x
        """
        questions = []

        for i in range(1000):
            a = random.randint(1, 25)
            b = random.randint(1, 25)
            answer = str(int(a + b))
            question = f"<font size=14>{a} + {b}</font>"

            questions.append((question, answer))
        
        return questions
    
    def generate_inter(self):
        """
        Genera ecuaciones del tipo ax + b = 0
        """
        questions = []

        for i in range(1000):
            coef = random.randint(2, 10)
            b    = random.randint(1, 20) * coef
            answer = str(int(b / coef))
            question = f"<font size=14>{coef}x - {b} = 0</font>"

            questions.append((question, answer))
        
        return questions
    
    def generate_hard(self):
        """
        Genera ecuaciones del tipo ax + b = c
        """
        questions = []

        for i in range(1000):
            coef = random.randint(2, 15)
            b    = random.randint(1, 25) * coef
            c    = random.randint(1, 5) * coef
            answer = str(int((c + b) / coef))
            question = f"<font size=14>{coef}x - {b} = {c}</font>"

            questions.append((question, answer))
        
        return questions


    def next_question(self):
        """
        Revisa si la respuesta es correcta, actualiza puntaje y muestra siguiente pregunta
        """
        if self.text_input.text() == self.answer:
            self.points += 1
            self.pts_title.setText(f"<font size=20>Puntos: <font color=green>{self.points}</font></font>")
        else:
            self.points -= 0.5
            self.pts_title.setText(f"<font size=20>Puntos: <font color=green>{self.points}</font></font>")

        question, answer = random.choice(self.questions)
        
        self.question.setText(question)
        self.answer = answer

        self.text_input.clear()
        
    def start_easy(self):
        self.questions = self.easy_questions
        self.start_game()
    
    def start_inter(self):
        self.questions = self.inter_questions
        self.start_game()
    
    def start_hard(self):
        self.questions = self.hard_questions
        self.start_game()

if __name__ == "__main__":
    app = QApplication([])

    widget = MathGame()
    widget.resize(1280, 720)
    widget.show()

    sys.exit(app.exec_())