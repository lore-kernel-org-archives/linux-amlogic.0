Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E60E7C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 20:03:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B369820851
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 20:03:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LLRxc8Dg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rheFNBYi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B369820851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NPahmlKbFZzxs6kYHpvjYFuuG4q28+V8XfDPkzAAPHQ=; b=LLRxc8Dg8Sy2i0
	x5aQJ0pVLNva/uo1SLE/joNOmzg+Ko5/lIaV6gW3kChiUyyKZxBlS0NyiGZwSYIa1cr00kIQF901L
	M5gM+C/bjFtWitpa1IIsHp9oy0eAgb7IAVfyFraFHmuNL89NkfI7j/PiuIbMoPPy+w2DRD2EAJCTo
	9AVLrfXR0dYtYf8OSGEf/QqLKQfSQpsO5A45cVJwA3LFApF0r4+GAklupnxG2W8+XjYFmDQfrwsTk
	IzobJucfvS5JD6fKbtBkdFp6nTrUbY1vcEGD+NdAeS6C+0qOb4+Q06mHXrM83rNxdJro+jUrGnMJu
	DMGJzspHrocgb/Qzojcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkDsV-0005ZU-PK; Thu, 17 Jan 2019 20:03:03 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkDsS-0005XL-ME
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 20:03:02 +0000
Received: by mail-pl1-x641.google.com with SMTP id gn14so5212651plb.10
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 12:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=a5n+9cXuiReBmKMc3Oq/wS2cWI61cMsEiCRcODxIuWQ=;
 b=rheFNBYiKCzvOH8OmfbzsLYpEez+E/fcQ/Hy0hFQ3F5G4hwdCZFMYYsHHhk3EqnFfP
 hgD7dktKyzYmOIxw05MaOgQQp3QwTvQ8KTDuPDDioRkdcYMJ1fw28tAh89znodsuX3Og
 82m9G92rf+K2n3OuykUMdL1XSHw3Ni0E5fFkFav3Acq0nd8+9pQgn/z41R2omGQZuhfc
 gwd1VtjCsGG7drkyIlO0yhJnlAKettACdBSdEEqhOD6w9LHGFp7XkmQ5DttgRfWekCv7
 n2oerTjBO2L+2tUN0OCPQDjQjaf/lPgYMcgVrxFyjqzGUUu7Egb5QwMJ9fECJFyeUqbJ
 LvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=a5n+9cXuiReBmKMc3Oq/wS2cWI61cMsEiCRcODxIuWQ=;
 b=bs8BZU8e0IGRvPJ2PSn8lXjtkCru4JiaBbv5RBpt7bHvrc+Cqy5xDpTK/ZPjKHb6Ks
 q4fHpnjrxig0+iPFugSkX8rH2rSv9IXcKfttZ9tu8H+XSBUaydaoRRKMUzHhp1mjJmOw
 vwUOo+NcW5Q4jv6JLw6gX/KsKXZucpXArqwBrmoHioAt70U5He//XQ8FslaAejoDNE+V
 AW0aK5cIWhVD9uGfICA9f8u480z2e4zun0D1SLsUMdwSgx7C4uXvzZLdlNkxHfpi7dZE
 H6bgPYmphwxNnr2zvQfTxaXiWDPaZuUswQdQ+Ca/MCZYH9VpIOJw6tR/AL9rmMwbOwgh
 Jtnw==
X-Gm-Message-State: AJcUukcag6H97cLkfMUen6vK1E69aEH6i3tsNZ94h57UgFcgaW+4Grij
 XJ6LJ219q4LdCpVoBJgqCMwufSSYehs=
X-Google-Smtp-Source: ALg8bN5TFo0cKp5d6oEjtLTGdCmWvWPYIxdF5b8A/fICP7RwXjsAXp5onkINseFCbKAToJAENcBHfQ==
X-Received: by 2002:a17:902:2aaa:: with SMTP id
 j39mr16687351plb.335.1547755379606; 
 Thu, 17 Jan 2019 12:02:59 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:e076:9fe9:59e2:1e0b])
 by smtp.googlemail.com with ESMTPSA id v72sm4720928pfd.163.2019.01.17.12.02.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 12:02:58 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: fix g12a buses
In-Reply-To: <20190116165236.8330-1-jbrunet@baylibre.com>
References: <20190116165236.8330-1-jbrunet@baylibre.com>
Date: Thu, 17 Jan 2019 12:02:57 -0800
Message-ID: <7hy37jaw7i.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_120300_728649_E5CC9422 
X-CRM114-Status: UNSURE (   5.48  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> periph and hiu bus addresses/size are wrong.
> cbus, aobus and apb just don't exist in the memory map so remove them.
>
> Fixes: 9c8c52f7cb4f ("arm64: dts: meson-g12a: add initial g12a s905d2 SoC DT support")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Queued as a fix for v5.0-rc (branch: v5.0/fixes)

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
