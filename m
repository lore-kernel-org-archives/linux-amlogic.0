Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B6FC2D0A3
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 16:41:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A14D2068D
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 16:41:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Aq+n03i9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="teNJyuyb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A14D2068D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rm6JcXBm4CgiCXcG5F5JRCZ4zHMbCg6UGOH5dWU9hIQ=; b=Aq+n03i9BzaosIzKPOZYA3Zmc
	3R1gSYf/i5S/vXH5urKzS2znxPo9wVnI23FGvN+jqqLlFm9kLOznKZfhI9BPzyY3Yx8j6wo04jTNP
	it+U4VHIM3QLGnuZVselvpOe050aUfR9oLDNTqC9rnOKy2Z0bD++qK/dQUJ/DlE15+4jHCa7iSxJO
	01PljRIIqxE1lgiwSD9r5u0ExWhA6D0U2NOEcOZjyiHMP5gEx2MC0bEBAMrJMg8PO8ZcdZackeoOW
	jADmevNA+V935jv8cqkb0Ij9om203DdlQvQYyeoF6xcfk98nd6G2cTEnW7tgHNJFG16pMoawKiOwe
	CWdWm0HDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kehZC-0000mS-90; Mon, 16 Nov 2020 16:41:22 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kehZ8-0000lu-6I
 for linux-amlogic@lists.infradead.org; Mon, 16 Nov 2020 16:41:19 +0000
Received: by mail-wr1-x444.google.com with SMTP id k2so19430197wrx.2
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Nov 2020 08:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=Rtf3WPy2v5/PbwArc8zsVNsYHP4yZqiUV6FRg+0fDSA=;
 b=teNJyuybcUBRu8Y/N3gpPv/LkkNYwAueeD6QaOUW4C0LP+SGZAkWUTyyfuxdp71ABj
 mwJazhnQ3ObYIxtFblXSVQyRtxkhhCkWVEsdYJHKkEa45fxyFsy8NkGaxQ264EhAFrah
 KE68YvuSveMPDdbqLjECCajE7wFZNJI3NnPI2Du5TADkSQfiSL5QcijOsW4jjUZbdASw
 9aoSkR+JnlXDaGMV6tl8WBux4Bod70pl/GYVIAYgmoWVXGpsa2puo9GSkE631MpSr0ri
 gY3AByZqA8TLYUJhmV6X3+QWnhG25t2sgOaTkjhlEVkjS/BKkzt5W2+NTVUWZqofvv2U
 vSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=Rtf3WPy2v5/PbwArc8zsVNsYHP4yZqiUV6FRg+0fDSA=;
 b=kzRcYUqUQvQVUzpKoW8drT7j9eEGP8RiBWuBpDxP5N3CWN5O9yYR+PskGFsW8Ku3N8
 RFwN6w+R2CC5MLHWoUkV/H5l5sBwakI39rNRG+2QRbJgNMFsZb7Z0RBHdWzi0FKbrPUW
 GnREJhSRRY6YHGpydTitnBcq9lB/UZgXMl44zJibrZmCh7t9Ha1H8berWcC54MmWTZIj
 0h3J4QFolVsW2JhvbWsu1QFLAAOjoRBwq6X9hdjFsO4J9AzoChhrsbyR0ZISzry9Wd8S
 1VBH+omdJgDJicCir4ogkhxDw2Qr70dnkefx0UrB+JMv7f7sX5abmsw3GXpSnSlZZuee
 IqaQ==
X-Gm-Message-State: AOAM531dZeKkow2yBR2h03f2Uz89320oIIkvo+gWFgy+DC8PjYs8rlXX
 MDbCTAMeY+lE5TqF17AsbdSbCQ==
X-Google-Smtp-Source: ABdhPJzvBUGf8eI0OYt/qmbfQt+9LTf5uEZcDSPO6S6VGAe1+j7kmLoBgoNQyoNJtK+MHMe/ypdKGw==
X-Received: by 2002:adf:f4c7:: with SMTP id h7mr19643713wrp.234.1605544875289; 
 Mon, 16 Nov 2020 08:41:15 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
 by smtp.gmail.com with ESMTPSA id k1sm20071604wrp.23.2020.11.16.08.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:41:14 -0800 (PST)
References: <20201112230043.28987-1-aouledameur@baylibre.com>
 <0f679c62aa48603ea43a8fa4819d688baa802d73.camel@pengutronix.de>
 <1jima91e92.fsf@starbuckisacylon.baylibre.com>
 <48332a44241f3c06966420277060b6048c1f77d0.camel@pengutronix.de>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Amjad Ouled-Ameur
 <aouledameur@baylibre.com>, Jim Quinlan <james.quinlan@broadcom.com>
Subject: Re: [PATCH v2] reset: make shared pulsed reset controls re-triggerable
In-reply-to: <48332a44241f3c06966420277060b6048c1f77d0.camel@pengutronix.de>
Message-ID: <1j4klp1cgm.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 16 Nov 2020 17:41:13 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_114118_371295_B56B8AC2 
X-CRM114-Status: GOOD (  23.52  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 16 Nov 2020 at 17:36, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> On Fri, 2020-11-13 at 16:13 +0100, Jerome Brunet wrote:
>> On Fri 13 Nov 2020 at 16:04, Philipp Zabel <p.zabel@pengutronix.de> wrote:
>> 
>> > On Fri, 2020-11-13 at 00:00 +0100, Amjad Ouled-Ameur wrote:
>> > > The current reset framework API does not allow to release what is done by
>> > > reset_control_reset(), IOW decrement triggered_count. Add the new
>> > > reset_control_rearm() call to do so.
>> > > 
>> > > When reset_control_reset() has been called once, the counter
>> > > triggered_count, in the reset framework, is incremented i.e the resource
>> > > under the reset is in-use and the reset should not be done again.
>> > > reset_control_rearm() would be the way to state that the resource is
>> > > no longer used and, that from the caller's perspective, the reset can be
>> > > fired again if necessary.
>> > > 
>> > > Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>> > > Reported-by: Jerome Brunet <jbrunet@baylibre.com>
>> > > ---
>> > > Change since v1: [0]
>> > > * Renamed the new call from reset_control_(array_)resettable to 
>> > > reset_control_(array_)rearm
>> > > * Open-coded reset_control_array_rearm to check for errors before
>> > > decrementing triggered_count because we cannot roll back in case an
>> > > error occurs while decrementing one of the rstc.
>> > > * Reworded the new call's description.
>> > 
>> > Thank you, applied to reset/next.
>> 
>> Hi Philipp,
>> 
>> Would it be possible to get an immutable branch/tag with this ?
>> It would allow to move forward on the USB side, without waiting for the
>> next rc1.
>
> Here you go,
>
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
>
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
>
> are available in the Git repository at:
>
>   git://git.pengutronix.de/git/pza/linux.git reset/shared-retrigger
>
> for you to fetch changes up to 557acb3d2cd9c82de19f944f6cc967a347735385:
>
>   reset: make shared pulsed reset controls re-triggerable (2020-11-16 17:05:28 +0100)
>
> ----------------------------------------------------------------
> Amjad Ouled-Ameur (1):
>       reset: make shared pulsed reset controls re-triggerable
>
>  drivers/reset/core.c  | 73 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/reset.h |  1 +
>  2 files changed, 74 insertions(+)
>

Thx Philipp !

> regards
> Philipp


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
