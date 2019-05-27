Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAAF6C04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:26:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 927E1208CA
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:26:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QKGmOm+R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="QDIRZ07y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 927E1208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NGJUDkykos3YBj4L661l9yHhW1rtXd6swlTJ+VKuthw=; b=QKGmOm+RpWEJRi
	vs5ix7cvKjA0b0dDls8/PyfPJgXDPvWlrRPOliLxax/4yhicTmlTwLOArGc8nzoH1UxoA7ljqsyG8
	YJAgT+jPe5QtjpFI6oOoKKaUoQotMk3rauk14lhmQhgE5RuZOR3fLtbDCfGE/H74pAn08+Znbwid5
	rF9NUk3a3Kr8VybNLfr7iyaKKmAs8QwUeDgRy48ZVtWGlzLcSQLItXjh/POG4RkK5nQ9x953BowRb
	Gdh1xM8EizoNdQjGbV3dzyyL2Cl5R6JV1cgipuHlPmkupqrtlsFJJZBTAxi06UV4+dgFJA5EsvhoL
	YL8rnQunyY6VNuFkB1nw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVKJz-0007Cy-PA; Mon, 27 May 2019 18:26:07 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVKJw-0007CG-Ac; Mon, 27 May 2019 18:26:05 +0000
Received: by mail-ot1-x342.google.com with SMTP id r10so15545534otd.4;
 Mon, 27 May 2019 11:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kEK8YEn82uZl3KtekPFpQObwQps/VzOazNNdEv6HIBA=;
 b=QDIRZ07yzcoElXx1D5ucFSGI3eU44JhkikzDlIE9bnlzRVnEM9LhsO50yqcl21AGha
 9kmUcGS0oL53IGMo08aR3nyTp5v7yS48O08Am9Q6zNRoxi2hdAfm9MpMHGed/eSNMhpa
 iLBCl+FLUYgSCC7gmBAQ7YDoxHRmex1pFUbX06J24JSTjn6yaNFjEmknNVP7k4luXkV6
 6aI1+2hG4rnvkESpzhGGrJNWbUU6hhvQyecWN39Sl/nT1deo9xjaXOiN33n9HhZXl4Og
 alAzIqNGSjcsErpW038oaoWDU2T/uGXpyh0NYmggXAAGNHqpvEuNXhuOiHbY/Sp6MAfM
 mFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kEK8YEn82uZl3KtekPFpQObwQps/VzOazNNdEv6HIBA=;
 b=Vsj6Pj7Ec5jbiwzDEr87aLZl58pP6jG6cPN0wJ81+tzXdysu3BDaFJ5SMjiKY0UTpr
 oi2/HSI18C6c2WpirX5s7anvl3pytYT7wLC3QLLZwKUqtLUMFT/+ZePgFU9jna714C0p
 aZcPvJgMSXaG3PHtLFy3zcxU4DRyTZnjy9+/mKnw4NFMLRqQvMmR16ZZpG5AYLI3vpoh
 iZvRtP0I5UsZnhh6IQFGBCKQ07L+Gn58HwueedYZr11AbGYYaQrZ0rDiLWk82et+JJwl
 2Gm0CK8I+AZJMxQe0+Mnk2xpHhXTdeTcgToMccgVPSqGoTX0YWWbjwtk1CXwECmQa0eo
 K5zw==
X-Gm-Message-State: APjAAAULINUTciN1aNq63C7vPTrbimuJRP7Myte+B/VKWM1XgRidwgpQ
 KUK5xXHjAmxhn6piq0A056dIuLk3uNSr8sdz7H8=
X-Google-Smtp-Source: APXvYqxO8mD3SqAenWNr+oA/vGJ22mekTdcIzROJVXOaweez4x2pUntpBksdEFug2PfumowB8H85gwXbyoy3O0xWdDE=
X-Received: by 2002:a9d:69c8:: with SMTP id v8mr18611131oto.6.1558981563581;
 Mon, 27 May 2019 11:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190527132200.17377-1-narmstrong@baylibre.com>
 <20190527132200.17377-11-narmstrong@baylibre.com>
In-Reply-To: <20190527132200.17377-11-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 May 2019 20:25:52 +0200
Message-ID: <CAFBinCDDGPqnFQjtJx8Ny7nuoKScq4qYwkNhznU+3TMMDOFWfw@mail.gmail.com>
Subject: Re: [PATCH 10/10] arm64: dts: meson-gxbb-vega-s95: add ethernet PHY
 interrupt
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_112604_369558_CFB68D92 
X-CRM114-Status: UNSURE (   6.92  )
X-CRM114-Notice: Please train this message.
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
Cc: khilman@baylibre.com, christianshewitt@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 27, 2019 at 3:24 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add the external ethernet PHY interrupt on the Vega S95 board.
>
> Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
I don't have this board (anymore, mine died) nor the schematics but it
matches other GXBB boards and looks correct so:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
