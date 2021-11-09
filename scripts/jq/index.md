## JQ Snippets

- Extract URL and Status pairs

```
jq -r ".log.entries | [.[] | {url: .request.url,status: .response.status}]" .\localhost.har
```


- Filter Requests that forbidden

```
jq -r ".log.entries | [.[] | select( .response.status == 403) | .request.url ]" .\localhost.har
```
