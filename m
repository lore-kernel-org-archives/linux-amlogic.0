From: khilman@baylibre.com (Kevin Hilman)
Date: Mon, 23 Jan 2017 10:06:08 -0800
Subject: [PATCH 0/2] Amlogic fixes for v4.10-rc
In-Reply-To: <70fdfbaa-f2d9-5524-97dc-ca61273980af@suse.de> ("Andreas
 =?utf-8?Q?F=C3=A4rber=22's?= message of "Sat, 21 Jan 2017 20:21:38 +0100")
References: <20170120162025.31806-1-khilman@baylibre.com>
 <70fdfbaa-f2d9-5524-97dc-ca61273980af@suse.de>
Message-ID: <m2lgu13b3j.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Andreas F?rber <afaerber@suse.de> writes:

> Kevin,
>
> Am 20.01.2017 um 17:20 schrieb Kevin Hilman:
>> A couple more Amlogic fixes for the -rc cycle.  The reserved memory is
>> updated after some debate/discussion of the first version.  This one
>> has and ack/review from Andreas who objected to the first version.
>
> Is it intentional that this is not a PULL?

Yes.  For one or two patches, arm-soc maintainers are happy to take
patches.  And in this case, it was especially intentional because these
have a dependency on stuff already in arm-soc fixes, so I wanted them to
be applied directly.

Kevin
