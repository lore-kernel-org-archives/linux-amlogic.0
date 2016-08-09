From: peter@korsgaard.com (Peter Korsgaard)
Date: Tue, 09 Aug 2016 13:48:03 +0200
Subject: [PATCH] i2c: don't print error when adding adapter fails
In-Reply-To: <1470742581-12971-2-git-send-email-wsa-dev@sang-engineering.com>
 (Wolfram Sang's message of "Tue, 9 Aug 2016 13:36:17 +0200")
References: <1470742581-12971-1-git-send-email-wsa-dev@sang-engineering.com>
 <1470742581-12971-2-git-send-email-wsa-dev@sang-engineering.com>
Message-ID: <87vaza2mfg.fsf@dell.be.48ers.dk>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

>>>>> "Wolfram" == Wolfram Sang <wsa-dev@sang-engineering.com> writes:

 > The core will do this for us now.
 > Signed-off-by: Wolfram Sang <wsa-dev@sang-engineering.com>
 > ---
 >  drivers/i2c/busses/i2c-ocores.c         | 4 +---

For i2c-ocores.c:

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
