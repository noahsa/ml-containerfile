from sklearn import (
    datasets,
    ensemble
)

if __name__ == '__main__':
    X, y = datasets.make_classification(n_samples=1000, n_features=4,
                                n_informative=2, n_redundant=0,
                                random_state=0, shuffle=False)

    clf = ensemble.RandomForestClassifier(max_depth=2, random_state=0)
    clf.fit(X, y)

    print(clf.predict([[0, 0, 0, 0]]))
