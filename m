From: wsa@the-dreams.de (Wolfram Sang)
Date: Tue, 9 Aug 2016 15:59:52 +0200
Subject: [PATCH] i2c: don't print error when adding adapter fails
In-Reply-To: <20160809115740.GA5528@pengutronix.de>
References: <1470742581-12971-1-git-send-email-wsa-dev@sang-engineering.com>
 <1470742581-12971-2-git-send-email-wsa-dev@sang-engineering.com>
 <20160809115740.GA5528@pengutronix.de>
Message-ID: <20160809135952.GA1666@katana>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Aug 09, 2016 at 01:57:40PM +0200, Uwe Kleine-K?nig wrote:
> Hello Wolfram,
> 
> On Tue, Aug 09, 2016 at 01:36:17PM +0200, Wolfram Sang wrote:
> > The core will do this for us now.
> 
> Would be nice to point out the relevant commit that changed the core in
> the commit log.

I agree, but it was a series of commits[1] so I skipped that idea.

[1] http://www.spinics.net/lists/linux-i2c/msg25496.html

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20160809/42837514/attachment.sig>
