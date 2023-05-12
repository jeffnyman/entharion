from entharion.memory import Memory


class Loader:
    @staticmethod
    def load(filename) -> Memory:
        f = open(filename, "rb")
        data = f.read()

        return Memory(data)
