Return-Path: <SRS0=vjaz=ZE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D038FC43331
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Nov 2019 17:13:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A15D22196E
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Nov 2019 17:13:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CwL8kVfB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="iGA4sXN2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A15D22196E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=q+iGiqo6xA0UA2LKq9JArePEJjsyGcaaESz10UgMoAc=; b=CwL8kVfBkItjz9FwTdWrFH4gl9
	8J+BbW73EOKKLwCd6L+UyVaJxpKBr/pdd7UhJ/VXUul322vVQT9pu+Mjp7nvRuh+IN4BsSsTRlTQO
	l1eUtd5B8X15JqwyxTcmWrx86Tu1Yjh51yo8ctSm7altjiO5qGHUSNbhxWBKX6NnQ+9uAfkbgL1at
	6aXEt8ipEVuHh5vtQfGzJ7ozMLV/PVrdJJ+12nKE/JomCbP0tkl311+5Xfd81ISXi8yL70qg1Y+R0
	tSlL6rGISP69WWCqIGSm++nqIO9bh7AybkqA8x4aRfv9svPG66dnvLb2AgHD7ozkh+TJqAdVdgrnu
	OnGqx3Ow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUZir-0007ov-FW; Tue, 12 Nov 2019 17:12:57 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUZin-0007oI-RS
 for linux-amlogic@lists.infradead.org; Tue, 12 Nov 2019 17:12:56 +0000
Received: by mail-wr1-x443.google.com with SMTP id a15so19372293wrf.9
 for <linux-amlogic@lists.infradead.org>; Tue, 12 Nov 2019 09:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=ZxA7qLekk+N/Dav/LrYpCZKrEOoovHS5Dd7O1QxXvPg=;
 b=iGA4sXN2p266Ip8URNSy7dqjA/Z0C+WYgUk+6xMsl8LgS8bQgxVyULQaD2vb0SR7j2
 b0jhJlUwjYJvkMwRbwUwpaVWo7gx+SAZpqX1vVRK6QL489vU1ZEdKUra77E8EtGU9uhd
 yZqI3JL4SvYL3q2fpJuUdqnj0+6CYdXOe3ZAUe8+8Y+ZAqwKXk1l4hbcJjN7ksDyiMkv
 ishUSxPcrA6ABohA6CRqfS6BQLRS0usW5wBDdATWnpCMk+yVjagnw17hoxiwrVaKeaqt
 NOvBrHvX8TmE6a0vkaYOk/ykSY4EPIB6Qoj6yTd8XczCrvFovihLLqBkLJjVpgJYkiP2
 XfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=ZxA7qLekk+N/Dav/LrYpCZKrEOoovHS5Dd7O1QxXvPg=;
 b=Ob7p8sWZVDRRczKbg1sNhpzFRoj9PGoj7mIu6kwp+g2chEe4YgiNzQRj2qbZdZGsjx
 QfKMR4vXsvMxxkBXnebv9Ziv2PlewqNSync2HVNy996KinJMM0erAK2T1KtsLb17Yn3n
 DahFZr3pZMRr5+FOYmu2DPUUGP6n+HSV0HpyW4gPMwBvWyb++GmVPt2DW+pb6GmgoV7T
 lJDr2cqnlw1jtF3YwSRI1qBUMcXeO9LzG/m5Ug0ZMRhEr/XvMMCB4RYe7qkipnqxH1wx
 HAfm5/fdkIlF67ZEH8P8GILSRrTUIYVLTkw7Zc9i63sIAYqmi7kbzm5PkKQkiCH8oJ5v
 GRUQ==
X-Gm-Message-State: APjAAAVr1r6TkqkaBj8I4tZEovxJHkXebYvu8s4MErFwoOBIHIJ+KEOi
 wOzfvIubWnMAcwXXvIQ+YYeIVSmtI6w=
X-Google-Smtp-Source: APXvYqxXk4QOi5t3c39JBIu/PqABL6KO249PbGRNZPb3VwQ97nfEmIS7gx53xgfuocXSPkN34AVp8Q==
X-Received: by 2002:adf:d4d0:: with SMTP id w16mr2761615wrk.184.1573578772462; 
 Tue, 12 Nov 2019 09:12:52 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id r15sm42846928wrc.5.2019.11.12.09.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 09:12:51 -0800 (PST)
References: <1572868495-84816-1-git-send-email-jianxin.pan@amlogic.com>
 <1ja79b4mje.fsf@starbuckisacylon.baylibre.com>
 <e80cb817-e58a-68ce-a3c6-d82636aaf7d3@amlogic.com>
 <1j8sou4u1g.fsf@starbuckisacylon.baylibre.com>
 <7ec2e682-cfec-395e-cf38-58f050440c40@amlogic.com>
 <1j7e4e4sab.fsf@starbuckisacylon.baylibre.com>
 <dee789ae-6825-3f4c-16e7-227e064562d6@amlogic.com>
 <1j5zjy4fif.fsf@starbuckisacylon.baylibre.com>
 <ec705819-9763-b0d2-9480-949e7ccd1cb9@amlogic.com>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Nan Li <Nan.Li@amlogic.com>, Jianxin Pan <Jianxin.Pan@amlogic.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2] mmc: meson-gx: fix mmc dma operation
In-reply-to: <ec705819-9763-b0d2-9480-949e7ccd1cb9@amlogic.com>
Date: Tue, 12 Nov 2019 18:12:50 +0100
Message-ID: <1jeeydf27h.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_091253_891992_55FE93A2 
X-CRM114-Status: GOOD (  11.85  )
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
Cc: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Victor Wan <victor.wan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Wed 06 Nov 2019 at 04:28, Nan Li <Nan.Li@amlogic.com> wrote:

>
> I see what you mean, pre/post_req already provides callbacks in meson_mmc_ops for the framework to decide whether to invoke the chain mode or not.
>
> However, I searched the frame of MMC and found the use of mmc_pre_req() for this callback in the block layer mmc_blk_mq_issue_rw_rq().
>
> Block layer mmc_blk_mq_issue_rw_rq() may be useful for emmc and SD card devices.
>
> But it may not be useful for reading and writing operations of sdio wifi, and the sdio device communication may not use the chain mode.
>
>
> Our chain-mode is a way to transfer data using dma.
>
> This approach is very efficient for reading and writing large amounts of data.
>
> If you don't do it that way, you'll do it the other way, the bounce buf way, which is limited by the size of the buf, so when you do big data reads and writes, it affects the transfer rate.
>
> Therefore, our chain mode means that emmc, SD card or sdio device will use dma to transfer data when reading and writing operations, so our previous driver and the patch behind me all ensure this.
>

I see.
The problem is that you are providing the same function to pre/post_req
callbacks and the request()

IOW, things mapped in the pre_req() callback might be unmapped by
request_done() instead post_req() which, I think, is not great.

It's been like that so far, your patch is not making much worse, so I
guess you can go ahead with it but we need to look a this before it
blows again

In the future, we should probably use the cookie to distinguish the 2
cases ... or drop pre/post_req in the ops.

Regards
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
