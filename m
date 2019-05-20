Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47987C04E87
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:56:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19C0220863
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:56:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IoNx2Ynk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="hPUG79Hf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19C0220863
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S/p+aoYW1KSBoV3+SaJsLgXccwM+ayPYjSnITsmtSes=; b=IoNx2YnkEcqVg4
	gZD8Y6lQKoKKzATB+UcEf5jRpETFYTaEB/+aw2FBCkXyh0XzzPjhXaY/1gOOB47QITzb0kTFuQWJq
	DzvFTsYP7RdoOC9vOe5GwyEkK1sXNeHYVppNNZCKMa8D+XTlRYozPWq0WBSzR/tCbSJ4hlSFubguT
	okesdOpKKh1ER41ADcX2VrJVrHA649idHMZkPEiLmA1AJK4nUbPIjMtVpJulD3jxDtHycyQecxwVL
	3gJaZkWTgGzLqH7s2kmZ29stjKlx/FH0IQKf0dwB/h+MDYLL2J86zeDIOACEUiN+1RC4Xx/AtHrKu
	xxh3kmRgozKBuGf94uPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSmWD-0007kU-1o; Mon, 20 May 2019 17:56:13 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSmW9-0007jW-Oy; Mon, 20 May 2019 17:56:10 +0000
Received: by mail-oi1-x241.google.com with SMTP id u199so10672389oie.5;
 Mon, 20 May 2019 10:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rnU52g/boLPrvaC7Lk7YTaYbB64jJRa17WqE6kdu0io=;
 b=hPUG79HfZRgIOAcjnjkcHWHEsotbZEp7IYdTnhO3sxpo39xGOJj26gWT+GrrmRR6D7
 NV5kY7MYANLoAYuiwh5Zlx6io39iLmeKXbsySsSgj4W3ws68vbPTf65+9uQykZKNhsNh
 hJVpZzdcFRxsPr2vO64EcyPRrqsljP/wdtgLtkbdeQVUNFglfotDJ1sx7eL7eKDSGwb+
 ADLqWW4FBTC3k4XdjDndzP1QhoDJU67f1ev04AOsg/xGHeefce7mRTj3RL/81+Shj9pb
 6rlOFr5eaNXHV5+LY5j2NKHNp9yShShMqaFRuiDnid91kvd5Hkvcaq/EchqMJOoWr1UT
 NgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rnU52g/boLPrvaC7Lk7YTaYbB64jJRa17WqE6kdu0io=;
 b=a3TbCWxYzpbwt/IXrtHpVvFvPPYzNcNb97rXeOwADuFbawe/vjFLCZs04gtSwXETpe
 tqCn3C3BFySrme3bJVkijUE5jUdpciHbayNf7vUJ6dFtD/bUGQGaOu9vcrWTMTmi72PJ
 o3halKj3uqGYda0i3r9nfGaEjEvH2UyMxi9X2Z6DAzQ8QDST25WvQiFkyGy079qIGJJP
 0a27DeSgtdJqR85VpJ4HpuowPoCOefFtKOQu32CTGwYmJh5mSmeXP/2OdVzEJOQcm+dd
 tTv7NtAP2B5FvzFvXfQCUTB7/xb5k5GvTSYBDu+K5pSyS80FfESx+buRG1rMEy5sqvVm
 D9Mg==
X-Gm-Message-State: APjAAAUL0sjdCZZQDN2YU12YDP30r9iVXZbNhFUI4joThV5U2Gc83RYA
 YfOh9vDIB1aQEHtHzv07IqjSwbRneSJ0NYqHRSjQX/ew1IA=
X-Google-Smtp-Source: APXvYqypP7Pacvyt44dFZalPqQM1rwMz7wLXcmXZyakgBMi7D5OnzzpRmOas/Vj22KygufhL8H7XqICxyFGZBT7JDWg=
X-Received: by 2002:aca:f144:: with SMTP id p65mr278504oih.47.1558374968921;
 Mon, 20 May 2019 10:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190520143551.2330-1-narmstrong@baylibre.com>
 <20190520143551.2330-2-narmstrong@baylibre.com>
In-Reply-To: <20190520143551.2330-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 May 2019 19:55:58 +0200
Message-ID: <CAFBinCDcs0YNpbe2ezn0bzE7n0PYj1u+Wx8abiBZRMBTAGye=g@mail.gmail.com>
Subject: Re: [PATCH 1/2] phy: amlogic: phy-meson-gxl-usb2: update with SPDX
 Licence identifier
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_105609_814092_B851E5BE 
X-CRM114-Status: UNSURE (   6.41  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kishon@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 20, 2019 at 4:36 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
