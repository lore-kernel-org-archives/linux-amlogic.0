Return-Path: <SRS0=O3JJ=Z7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F88C43603
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 21:52:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB9E4205C9
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 21:52:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LJNRK36s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tY1B/g/W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB9E4205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SweLbjtM34hW/yNuPtmZ3QTMgM2rtm5UkHW4+APn7BQ=; b=LJNRK36sqZ3jxC
	c4031QNG9xmC1J8wGzZj/Gh77IrxSXkvLierUfQ9vSnbQ/7gklBMWYkbhueA9N/YsQqy+KjyGSjAS
	4aZm8xdPsE17SyzckP/IgjUpgIPUc306WjZe7ZWWuXNBv8EN+aYAoCx9e8yparf24SFkW2aFW3gWH
	1iZ4+2Uv4uUAQlBj5m13bZrbMujSCWHjRjz6tkarqyMZtLXE9NGeIrvhlSTk1sLmbqVs+g/epGzS2
	CEzK6YRSxN9s/+TkklnfPgs/CZqlWcuJAop+CyTprdNK4PKbHvAAoe5fiOhcgSMBTaxdNjI+iE6TG
	LzYheDHATjtubHMP2keA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieQx3-0006kE-6S; Mon, 09 Dec 2019 21:52:21 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieQwz-0006iv-MO
 for linux-amlogic@lists.infradead.org; Mon, 09 Dec 2019 21:52:19 +0000
Received: by mail-pg1-x541.google.com with SMTP id s64so1061442pgb.9
 for <linux-amlogic@lists.infradead.org>; Mon, 09 Dec 2019 13:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=i5+TnwHki7CwB9DGX3Mta0rJCHBm+w/ZGchbVbmsZYk=;
 b=tY1B/g/W6Gp0eDto/4M5qAgnEJFLIsacGgPoR131eRiJk7fUtWl4e5TQIlC1CAiwdY
 b2TBMj1z/kkjZxyKSMYaCnnAel2maeSAGyyUqpShy5+reGnTxRvNPJnUa54b2HshK+sw
 t+J0fkA28IJXOSml4Jbt+zWayFEF8JZiQi3qqIpF4RsKMh+2RK1GijtLBE9c5vl5ZJ2o
 oK2ucjV+VnSS61VxdpB2OPot2SGhvHBBB+vFt9nNelUOZSqQIPhVC1ofDKm0wlM+tnbe
 yYfDf7wS04Ibq9CrYi9EXfDHETyRs5qRNWbuNJ7rOu+M7/dQiZLDtmcjMWT9YUPboBG/
 vJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=i5+TnwHki7CwB9DGX3Mta0rJCHBm+w/ZGchbVbmsZYk=;
 b=haHTT49T1A4MScI6+UrIwi9R52BaOiQOX7ztkFmRjKawz4k/7HWYy4sqpaMF4jHKtI
 NHzaZFobVAXG/88ZTetmzsZJ8yDKTkpiB3Ie8/PqPHyDzXEVYVjFrx+D5vslTu0ECA9S
 8fuVkykMWfc4ojPZdBJINwOQeIiY/BlVZoIe5v7X8EaLy5UvikRXqWJZ3Wlgzrkhdr3a
 iViisEMfe/5VXDYTHEcY0teLjweh76x4Qdit5bCaW+ayr/QfyXzI0VRMDLLjV1bRAQ9a
 Lb0KDObQjnVY57//vM+SZeh/inkzdOcHaqgXC4XxH6d/yx6lGsfN+pL776cu8y0SYkuu
 vyMQ==
X-Gm-Message-State: APjAAAUzP4aRFd4Yd9amc0xYNOZ0lsVFPv0RytNVDSjsmuCHF5/wxcuA
 B1nab3l0NUNrhXg39xq97AHoxg==
X-Google-Smtp-Source: APXvYqwJ+lQOvhufrrs8iA3BVrUFuPSN7n3NPPeGKXKlHT1K24DHqB1iVmQmDkzXvU5fBntaC/ym1Q==
X-Received: by 2002:a63:1624:: with SMTP id w36mr19463046pgl.404.1575928336235; 
 Mon, 09 Dec 2019 13:52:16 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id i127sm465841pfe.54.2019.12.09.13.52.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Dec 2019 13:52:15 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Xingyu Chen <xingyu.chen@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 1/3] arm64: dts: meson: add reset controller for
 Meson-A1 SoC
In-Reply-To: <1569738255-3941-2-git-send-email-xingyu.chen@amlogic.com>
References: <1569738255-3941-1-git-send-email-xingyu.chen@amlogic.com>
 <1569738255-3941-2-git-send-email-xingyu.chen@amlogic.com>
Date: Mon, 09 Dec 2019 13:52:14 -0800
Message-ID: <7hsgltrwtt.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_135217_868785_3684A9F3 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Xingyu Chen <xingyu.chen@amlogic.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Xiangyu,

Xingyu Chen <xingyu.chen@amlogic.com> writes:

> Add the reset controller device of Meson-A1 SoC family
>
> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>

I just realized I missed the DT patch for this series.  Sorry about
that.  Generally it helps if you (re)send the DT patches separate from
the driver, and if if it's been a couple weeks and you haven't heard
from me, don't hesitate to ping me.

Queuing this up now, with Neils tag.  Sorry for the delay.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
