CREATE TABLE Поросята (id SERIAL, вес INT, PRIMARY KEY(id), CHECK (вес >= 0));
CREATE TABLE Кормежка (номер_поросенка INT, FOREIGN KEY (номер_поросенка) REFERENCES Поросята(id));
