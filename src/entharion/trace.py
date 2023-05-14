class Trace:
    def __init__(self) -> None:
        self.file = open("log_trace.txt", "w")
        self.message = []

    def add(self, text: str) -> None:
        self.message.append(text)

    def generate(self) -> None:
        composed_message = " ".join(self.message)
        self.file.write(f"{composed_message}\n")
        self.message = []
