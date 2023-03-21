Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FE5C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Mar 2023 20:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bf92dWNNsZsg4yGA5MSnAA6HnJXlnkrYZzefv6ned/U=; b=geCFQxLPJx9juc
	g0EkBK9LGtMEVhrBFWIB9D6vhP6WecW4u6S8sEICFjkEBgg4w1JhAwaf2i+H7BECrHC0RU4JIhkL9
	WYWRVyGGhd26WZjJ9T75x87SUQuJgCKrpcibzUWz5N1aqzzoMPbKdU72AF7qa0Jg77oOpw5mbJdio
	zFdQ9ugvjZgYjjuCO77O6l2TCTuYs1rZf7WW6rsKv365w8tt3UbXQrYkPevlHSXxYvOIxP8WVFwks
	UEwVtxH/lxudspDa9z8su3EKsU+sOlPQTnkDOOxseKc4Vq1ZjZG0O99OMb5K5T4VqIO/T7aqnTU9N
	fNkINNQrCvcqsJXkY/Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peiOs-00DdzR-28;
	Tue, 21 Mar 2023 20:16:06 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peiOh-00Ddpk-1N;
	Tue, 21 Mar 2023 20:16:03 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 92EF0FF802;
	Tue, 21 Mar 2023 20:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679429750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cc+qNEZ1EzSB9IZt8CHtV76yUlh0JjmYuBy/GWO2DUs=;
	b=OJi5weJFGQioSkJQd5/SUYbolA50WhSTiYvD06XBP9RW5a91sWOLAirktoEIQNx2l7cojo
	4PLPVb/XYsSgRt+EtykaDwuJjFNaUjBMP1w6iD6DkyZVq4heLOklu6kqWyu2mh67Dci6w7
	rSKinPXvCKraO8/H6s8XlSLRWUsJ/yhDDqysEG4YQY6kMvg4dIo9n7HgZdsK9U7UViQlNV
	rWSguoyaBBHahzLRyHmY1dMQ9QHZ8LAi3yojE0biQ0l0/2qoxdYvQnMR2pNf2PAoXzCC7A
	19Fld+FXsCIflcXr+eLbhPcR/syNggMCz4SB6g7hPxCOVu/RlINPPEm06xn8Ug==
Date: Tue, 21 Mar 2023 21:15:49 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, linux-amlogic@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 RFC] rtc: meson-vrtc: Use ktime_get_real_ts64() to get
 the current time
Message-ID: <167942973227.681565.15801130800253450098.b4-ty@bootlin.com>
References: <20230320212142.2355062-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230320212142.2355062-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_131555_685261_88DD9ED3 
X-CRM114-Status: GOOD (  13.87  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon, 20 Mar 2023 22:21:42 +0100, Martin Blumenstingl wrote:
> The VRTC alarm register can be programmed with an amount of seconds
> after which the SoC will be woken up by the VRTC timer again. We are
> already converting the alarm time from meson_vrtc_set_alarm() to
> "seconds since 1970". This means we also need to use "seconds since
> 1970" for the current time.
> 
> This fixes a problem where setting the alarm to one minute in the future
> results in the firmware (which handles wakeup) to output (on the serial
> console) that the system will be woken up in billions of seconds.
> ktime_get_raw_ts64() returns the time since boot, not since 1970. Switch
> to ktime_get_real_ts64() to fix the calculation of the alarm time and to
> make the SoC wake up at the specified date/time. Also the firmware
> (which manages suspend) now prints either 59 or 60 seconds until wakeup
> (depending on how long it takes for the system to enter suspend).
> 
> [...]

Applied, thanks!

[1/1] rtc: meson-vrtc: Use ktime_get_real_ts64() to get the current time
      commit: 0e6255fa3f649170da6bd1a544680589cfae1131

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
