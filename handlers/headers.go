package handlers

import (
	"fmt"
	"net/http"
	"net/http/httputil"
	"time"

	"github.com/gstackio/sample-app/helpers"
)

type Headers struct {
}

func (p *Headers) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	dump, err := httputil.DumpRequest(r, true)

	if err != nil {
		w.Write([]byte(err.Error()))
	}

	fmt.Fprintf(w, "%q", dump)
}
