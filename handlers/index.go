package handlers

import (
	"fmt"
	"net/http"

	"github.com/gstackio/sample-app/helpers"
)

type Index struct {
}

func (_ *Index) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	index, err := helpers.FetchIndex()

	if err != nil {
		w.Write([]byte(err.Error()))
	}

	w.Write([]byte(fmt.Sprintf("%d", index)))
}
