From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 08 Jul 2016 09:20:40 -0700
Subject: [PATCH v3 0/2] AMLogic Meson SoC RTC driver
In-Reply-To: <1467748089-14718-1-git-send-email-ben.dooks@codethink.co.uk>
 (Ben Dooks's message of "Tue, 5 Jul 2016 20:48:06 +0100")
References: <1467748089-14718-1-git-send-email-ben.dooks@codethink.co.uk>
Message-ID: <7hinwg85k7.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Ben Dooks <ben.dooks@codethink.co.uk> writes:

> This series adds support for the on SoC RTC driver on the
> AMLogic Meson devices.

-ECONFUSED

In reply to this patch, there are two other "PATCH v3 0/2" replies, an
then the two patches themselves, have "PATCH n/4" subjects when one
would expect "PATCH n/2" subjects.

Might I recommend that you use 'git format-patch --cover-letter
--subject-prefix="PATCH vX"' when formatting your series.  Doing that
will take care of all the numbering for you.

Anyways, I was able to test this version with the DTs from the previous
version, and it works ok.

Can you respin one more time (including the Tested-by) so the RTC
maintainers can pick it up?

Thanks,

Kevin
