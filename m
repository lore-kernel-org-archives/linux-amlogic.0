Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80409C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Nov 2021 10:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ONMdmcX5TP2bXi91+QhDgFl4PMuigJigEirM6RUx8U=; b=oEK9QDZVY+AB+H
	WtCKePWrHvHxjl/HgLXBHyAEWPqzfS2pzEgUBA8BwjiJ9sxGMZcF37Sm7kwlLOsbsS055DLrtJiCm
	ewdSdLvojn3tKNYHhveNDRe4V6iiuxVLzOnMlCqs/6DdCMiL1tnCX8xajrhDxyGhJl22fpS53wPYS
	05C1Ye+N92WmyROahQcQRthpu4QpKPM+1r7UNeiobjMGM3xzfr9xZmwjkLHDUdDUJ3wNu7UNX7q/O
	kZDW16H03LoZW2FRvPAtxpDWXsICqcoV1E7vzPoOVyrBUfqxbUKw4l5GxATQXqUAUFQuZPc4YSwCX
	Y01lqsD3A3pYz+lbynWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms0IK-004aMX-US; Tue, 30 Nov 2021 10:23:28 +0000
Received: from smtp2.axis.com ([195.60.68.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms02U-004V7G-AC
 for linux-amlogic@lists.infradead.org; Tue, 30 Nov 2021 10:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1638266826;
 x=1669802826; h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-transfer-encoding;
 bh=UCgk7kbDQh7QdhPkOEMiahIQV6+21NZJki0/IukQ16o=;
 b=jOAkltqZy1NE3259xMh8LFVnbJM5KPjWquDyPI0BbLHWGVl6t7DL1y1l
 tM0dmLdb5glkjXEatqP87wQBhOD6mcd14YuHcwexS18+0W4tnJfeeMQhY
 r4VEXzoPzgJDaB9JkWni3y7Wv2Z8IgKLBwxZiAudvdrU/TFPRicEpETEO
 EYfICQ5IvY9DBnYVocJLzl/sDZrEWkqy4XbpS/yYwT+pJ/myyLE4saRaf
 6PzIOHz0NuxdA8XhvzIU1SePPl7M6jOLYoj+2eE0OUi3C5MjgpIa/TfzI
 Fg+rPp71zRYsIwoQ8FiT0ColYmb6b7IAYqEmheFAKYzjO25d3lj+7HwfF g==;
Date: Tue, 30 Nov 2021 11:06:52 +0100
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: Jerome Brunet <jbrunet@baylibre.com>
CC: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: meson: use dev_err_probe
In-Reply-To: <20211130093617.103147-1-jbrunet@baylibre.com>
Message-ID: <alpine.DEB.2.21.2111301104440.30606@lnxricardw1.se.axis.com>
References: <20211130093617.103147-1-jbrunet@baylibre.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail08w.axis.com (10.20.40.14) To se-mail07w.axis.com
 (10.20.40.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_020706_749328_2F10D189 
X-CRM114-Status: GOOD (  15.54  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Tue, 30 Nov 2021, Jerome Brunet wrote:

> Use dev_err_probe() helper function to handle probe deferral.
> It removes the open coded test for -EPROBE_DEFER but more importantly, it
> sets the deferral reason in debugfs which is great for debugging.
> =

> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> =A0sound/soc/meson/aiu.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 17 +=
++++++----------
> =A0sound/soc/meson/axg-fifo.c=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 9 +++------
> =A0sound/soc/meson/axg-pdm.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 9 +++----=
--
> =A0sound/soc/meson/axg-spdifin.c=A0=A0=A0=A0=A0=A0 |=A0 6 ++----
> =A0sound/soc/meson/axg-spdifout.c=A0=A0=A0=A0=A0 |=A0 6 ++----
> =A0sound/soc/meson/axg-tdm-formatter.c | 18 ++++++------------
> =A0sound/soc/meson/axg-tdm-interface.c |=A0 9 +++------
> =A0sound/soc/meson/meson-card-utils.c=A0 |=A0 4 ++--
> =A0sound/soc/meson/t9015.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 8 +++=
+----
> =A09 files changed, 32 insertions(+), 54 deletions(-)
> =

> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index ba15d5762b0b..37036adf14ce 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -219,31 +219,29 @@ static int aiu_clk_get(struct device *dev)
> =A0
> =A0=A0=A0=A0=A0=A0=A0=A0 aiu->pclk =3D devm_clk_get(dev, "pclk");
> =A0=A0=A0=A0=A0=A0=A0=A0 if (IS_ERR(aiu->pclk)) {
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (PTR_ERR(aiu->pclk) !=3D -=
EPROBE_DEFER)
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_e=
rr(dev, "Can't get the aiu pclk\n");
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err_probe(dev, PTR_ERR(ai=
u->pclk),
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 "Can't get the aiu pclk\n");
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return PTR_ERR(aiu->pclk=
);
> =A0=A0=A0=A0=A0=A0=A0=A0 }

A minor thing, but dev_err_probe returns its err argument, so this =

construct can be written more tersely as:

		return dev_err_probe(dev, PTR_ERR(aio->pclk),
                                     "Can't get the aio pclk\n");

and that also seems to be in common usage when browsing existing code.

/Ricard
-- =

Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
