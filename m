Return-Path: <SRS0=drR+=TO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8E2C04AB4
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 18:05:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3ADA20850
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 18:05:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XpnMp9aW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="aMJHVMpr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3ADA20850
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NFHU3WZeNrhCBm4RRMbNzDfBA4F7ycujbop4uYrmJM8=; b=XpnMp9aWnAAqH3
	HPSIXkX9ryo9dMvFVdwct6cIh2ZJHXwnk8N2ajRbdZQ9SjXJThsIbsyZCH/3B0qhagpGlyoHRIs2p
	09XOOlUriZaHbqzy4+UqAJoSaYIIzt248dtbQGshl2YBZ3L/tFkLfewtJxwFkOuE8aW3jJZuWaecm
	XxvxvqLNirdRbT2CWtfnXk4S/VA6ZKEKbdHSkShPWo5bVqwcRq8XXMvynikkyaK/td07Jk2D1ZFJ0
	qfJKoPLbf5Uqodk3azHciAiTUDLU2UoEJxlj6qTdCGl5FuDtT3egJXiDOZkDtTjahtZFhNmUo90f0
	46xRAzbSHj0D0eCQJtFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQbo6-00045t-VX; Tue, 14 May 2019 18:05:42 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQbo4-00045a-Ma
 for linux-amlogic@lists.infradead.org; Tue, 14 May 2019 18:05:42 +0000
Received: by mail-ot1-x341.google.com with SMTP id g18so15896321otj.11
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 11:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+D/N+r1giXeXDAaGbyLrs8fCnRD/jcuGXeK2jnEOa8o=;
 b=aMJHVMprRMJ1ROstXctMEViVqeogfaxUVHPAZxxWl6nkAZSwE8NnZmadm8c8ZGWja7
 xECrK6tb7cTD66LLaTFX2RHjxtVa9Mj9TS8mew4SLaxuezYxim/hjdnSHkx5x71XITQy
 18bv3P1tzIaadPmZJLANY3dz8bzt8/JZOA1eCdOYPdFVgKoQqDn0Lslpc81WiPWs/SzD
 6FdMQ/A0D6j6NNE5sA0UdNVMd08grw8arZxoMBch/UwXWp/ge3FXxnisgSFssMjotfIz
 Dou4UzGDPQ6S14fT/mLjSXNIztmu90TpZwXEoXh+irAV/YHj1wTzrIrAaHeifKWTNEur
 rlww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+D/N+r1giXeXDAaGbyLrs8fCnRD/jcuGXeK2jnEOa8o=;
 b=ksOlhfOyTRidEeSGNhW6SnP5PniGWdx74OMHgcNsxEmlfaLSSJvrfIfATXdo1jJnrL
 G9jercYvJ33n9NExKg/sbiwer5bNSobc6nNPlPN01U4tLPhDF6z5e+Bx1eeEnROlSt6s
 kYZMkAV9lbL/8JeW/hYMKK70nM/N/yEJ6TfiMCOsu/1rO7CjkpSIoFr7od/ZxO0DPxWW
 o4dHylh3mtmecdEAEoL3NAymezwlvpBon8YBY50lKx/SoP7dThaj1ZmO0/dj9jUOv62M
 XLJZ9SKDzqe3meD7OyOwqSwOxoZX+g3m/xAJ0LYj9ae0xDaP/YRdQm8pesBiPDekf5JR
 Lvag==
X-Gm-Message-State: APjAAAW+NAVFerxQ5WDvP/N01T+nQs937c2kC1lccnhJSMKr+uDMN11+
 h45bKBahTr2ceAIboJmomkfD4Tb7tB9MX4zxw6U=
X-Google-Smtp-Source: APXvYqzWsq8151+UbJ2LbnrNIepcgZ940jijOe83vsRThzaVL6cIRg6qRcoRT17i6RTor2GTk3ILIIITR7bW4w5tGDE=
X-Received: by 2002:a9d:141:: with SMTP id 59mr21942610otu.158.1557857139636; 
 Tue, 14 May 2019 11:05:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190513130507.22533-1-jbrunet@baylibre.com>
In-Reply-To: <20190513130507.22533-1-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 14 May 2019 20:05:28 +0200
Message-ID: <CAFBinCC+TKf_WO_fwqEu8Gzc7r3od6xkCyN6-9hPz9-0nmEw0g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: nanopi k2: add sd DDR50
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_110540_762454_57766D37 
X-CRM114-Status: UNSURE (   7.55  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 13, 2019 at 3:05 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> Add UHS ddr50 mode to the nanopi k2
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

since I'm curious: is this due to your recent meson-gx-mmc patches?
this is the first board where we enable the UHS DDR50 mode


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
