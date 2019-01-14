Return-Path: <SRS0=InoK=PW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402DDC43387
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jan 2019 14:36:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFE9E206B7
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jan 2019 14:36:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a/G1lAoF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDmDxoZI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFE9E206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UJDs7rtsU8v5tZvZlx9BgcHyNgjBVPulNrlfde+7OEo=; b=a/G1lAoFd4CsHL
	QKVrg2j8tQ3os7/tX0MxD+rQPD2A6B7VS9WL/u/44qyPwUlsjFww+Vu/QkXhoWTv9UHYlUHbJfifH
	pUtaQMlwHynU71MEhPDqB7Gsq1BBOWX6nIw9EcpG0F0cxLj3pl7LfPBrJSTlXhPyIYvLfIXYKu2dI
	Q+L4jng70u26/bq7F1sfssYfxQjH8Tsr3nmc9fuxSqj4YoC55QgvCQbGuLTgUhJFPuctNNtY0bPEF
	7psykRQcnMb5pOOzRN8imncw2MdQA7UwSUb0di+NLDyUoxIdof8rQqtBZlC7SsCt7XW7f3NbrzFns
	rxnYJzhx/+8QpNRiaxOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gj3LO-000246-N1; Mon, 14 Jan 2019 14:36:02 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gj3LL-00023Z-KF
 for linux-amlogic@lists.infradead.org; Mon, 14 Jan 2019 14:36:01 +0000
Received: by mail-ed1-x52e.google.com with SMTP id b3so18915381ede.1
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Jan 2019 06:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=7ezDtzsn3dkuP6TBdyRQ8AexhGqfywi8FAUO1lvBi8g=;
 b=cDmDxoZIeCy+UnHGh1vNa4uSWs3K4c22TGkKy1rtZI/P1TCN1/PWO3M3/Cs0S32k15
 zm95xg02UYkPYjp4Tjni1hZUavh9giVS0sK7B30+dp2900mbWkCz1RAv84UupBB508QN
 +FPIw9oDYLzeAxsoiSoa2zOb4JG+mdh8bMJMmiFociiZ1W0fgOaamN2SCulSQAAIgSUz
 xCC6Pxf1U68UWflkXJnH+MrPuS5H9dZ/Zx0J4gLajHzr/WAeccpGFp1oLwOOuvCVD8Cb
 D10WFmS5LjzprXej92b1G+KLvSdessA+3qKvR5a+DWHdM32TXRvbmYvBi1tZsXzvyd/m
 Tdig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=7ezDtzsn3dkuP6TBdyRQ8AexhGqfywi8FAUO1lvBi8g=;
 b=jDoS1CndoDELjAeePKive+YuEFavRk09gMZTW7pWq6+xdnLFBFCI87jm+ErHM28kEA
 0fIcXX237STYaDaSH6XxrDGLM/7ObQJzm53J4jeuSptg8BrDVVf8whpl/KFzsx7iDYqL
 ZQXdI4MwmniEiwzpC86a2hYVQRi2gM/opFyJR4SoVVOV/bLiTqUp9z3gryIpFl2zNlZg
 1bUqxKN2vbB9CXgEAcfNuDhcxsljT2dqgncgtx4ngU9yBIjfUvGKlTtoWnitV9+6CpIi
 P3gwdru92pIGZrZXCIHKE4xcXd78Dqfz3QcOY6sE/2fVSuP+1N8x3G8T0cR2K9AThTgM
 agSw==
X-Gm-Message-State: AJcUukcW3naW2vqscd9iPUusAjNPVjdadyup3lf78l57rRQqRNDt+FFp
 qQqAvRQKdVdcGI/OM4RehmU=
X-Google-Smtp-Source: ALg8bN6CM/m8j5rUdfew5lz3lFK/RvLnVpqqrOLMMh+Eo/k/gkTsdKtkl4S1l6BG3Ct7+GE8rFE2wg==
X-Received: by 2002:a17:906:738b:: with SMTP id
 f11-v6mr20255186ejl.234.1547476554228; 
 Mon, 14 Jan 2019 06:35:54 -0800 (PST)
Received: from dell.be.48ers.dk (d528f5fe4.static.telenet.be. [82.143.95.228])
 by smtp.gmail.com with ESMTPSA id
 y26-v6sm2412473ejb.24.2019.01.14.06.35.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 14 Jan 2019 06:35:52 -0800 (PST)
Received: from peko by dell.be.48ers.dk with local (Exim 4.89)
 (envelope-from <peter@korsgaard.com>)
 id 1gj3LE-00056m-Ct; Mon, 14 Jan 2019 15:35:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: amlogic mmc_partitions support
References: <CALtMJECdszQv+ZqbPv9dfq2QbogVJMfth+fNL40pgwh0_RtbCw@mail.gmail.com>
 <1d699426-5744-5149-f136-66db54b87056@baylibre.com>
Date: Mon, 14 Jan 2019 15:35:52 +0100
In-Reply-To: <1d699426-5744-5149-f136-66db54b87056@baylibre.com> (Neil
 Armstrong's message of "Mon, 14 Jan 2019 11:00:04 +0100")
Message-ID: <87ef9fxq5z.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190114_063559_698277_581939C6 
X-CRM114-Status: GOOD (  11.79  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, Andreas Fenkart <afenkart@gmail.com>,
 krzysztof.michonski@digitalstrom.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

>>>>> "Neil" == Neil Armstrong <narmstrong@baylibre.com> writes:

 > Hi Andreas,
 > On 14/01/2019 10:54, Andreas Fenkart wrote:
 >> Hi,
 >> 
 >> What is a feasible way to port the vendor supplied
 >> drivers/amlogic/mmc/emmc_partitions.c into something that could be
 >> mainlined? My thought is to create a custom block/partition/amlogic.c
 >> driver. Would that have a chance to be included in mainline?

 > Basically, Amlogic uses the eMMC main partition as a MTD devices and uses a
 > custom DT partition scheme to export named MTD partitions to user-space.

 > They don't use any "standard" partitions schemes on the eMMC main HW partition.

 > Mainline will never support DT-defined MMC partitions, and will never support
 > a MTD indirection to a MMC HW partition either.

 > You can try to implement something similar using FUSE, but it won't be simple.

Not knowing anything about the vendor driver, if this is just about
splitting up a single eMMC partition in sub blocks and not about MTD,
then this can be easily done with the dm-linear target of device mapper,
E.G. something like:

dmsetup create FOO --table "0 <size> linear /dev/mmcblk0 <offset>"

-- 
Bye, Peter Korsgaard

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
