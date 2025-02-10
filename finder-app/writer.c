#include <stdio.h>
#include <syslog.h>

int main(int argc, char* argv[])
{
	FILE* fp = NULL;

	openlog(NULL, 0, LOG_USER);

	if (argc < 3)
	{
		syslog(LOG_ERR, "Not enough arguments");

		closelog();

		return 1;
	}

	fp = fopen(argv[1], "w");
	if (fp != NULL)
	{
		syslog(LOG_DEBUG, "Writing %s to %s", argv[2], argv[1]);

		fprintf(fp, "%s", argv[2]);
	}
	else
	{
		syslog(LOG_ERR, "Couldn't open file %s", argv[0]);

		closelog();

		return 1;
	}

	fclose(fp);

	closelog();

	return 0;
}
