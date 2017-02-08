From: p.zabel@pengutronix.de (Philipp Zabel)
Date: Wed, 08 Feb 2017 11:43:39 +0100
Subject: [PATCH 0/4] reset: de-modularize the remaining reset drivers
In-Reply-To: <20170208001847.9887-1-paul.gortmaker@windriver.com>
References: <20170208001847.9887-1-paul.gortmaker@windriver.com>
Message-ID: <1486550619.2309.36.camel@pengutronix.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Paul,

On Tue, 2017-02-07 at 19:18 -0500, Paul Gortmaker wrote:
> Recently, a new reset driver was added that used module stuff in a
> driver that was clearly non-modular[1].  With that in mind, it is
> probably wise to get the remaining patches I have locally for the
> existing reset drivers out the door, so we don't get any more
> future instances of a new driver copying the old error once again.

Applied, much appreciated.
I'll wait a bit for the remaining authors' Acked-by:s and then push them
out.

regards
Philipp
