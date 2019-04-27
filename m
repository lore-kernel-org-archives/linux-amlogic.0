Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DF3C43218
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 20:29:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9504F2067C
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 20:29:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t4rEK/bd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="sb8gi04u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9504F2067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CDte8C2cM2QrV32u/g+5KUHBxMozX03PPxY7aysZlms=; b=t4rEK/bd8Txxuz
	GkVdPohGwmXeYx1dDP+2bT41gJ5Xiw+zjv+fbPRSPqgQX1M5kaRgd8lPEeoiiRLupHPt06fQMtgGc
	qG8do0kDl6mnyE0z1An+NKXNqynyesHZ9hcTo4F8q7qZ2irEFwq1I35VUPDMIoiAoOFS+EsrxyXK4
	D3LZn+2XxuaV4xvBA3UYUeIE1dg7YcXa3a2UalyJIgLZLvRVTGi/P/1p/zfrWJuEUvJ78aVShJHsn
	UEIfayYXPDkD8JjJacEd7HhnSoIQi9uCuN0hmKJbBk2sel1lo6JFSjTwCOiaZKlCeQKw18suZ9xuQ
	8D5v0P70Re6s8ir8Uymg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKTx2-0004sI-99; Sat, 27 Apr 2019 20:29:36 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKTwz-0004rl-Bv; Sat, 27 Apr 2019 20:29:34 +0000
Received: by mail-ot1-x343.google.com with SMTP id y22so5546671oto.3;
 Sat, 27 Apr 2019 13:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r+u1Uc4MpTFdNT8VK8aH808CBTf1BtkCYQRBGkAzTTY=;
 b=sb8gi04uP2A7Hfb/6So0ySjafBDIIFKDXroacQDp23Vn5PiHFtIn2MMEMF6GHONT9j
 jt/rYD/pDq+ZMecfDFF+b6wsfC4DAZ+zgTSAPxgmU099C5QKWaBb3NqMGdor2l9KApDa
 oboT/QVqH0Ey/vLTm90zd3LYU/HCe4eQMlM9761oFZUC4M2BZHEtldjbMcKpTs5PL8fG
 9uvPKqnwvYbUc7D569vKwBfxA+9LFqkeLI0iVsY2VyAMhyAtOoiibJvnNCljBFMY3ljc
 H2EQvrN/N2UEWqO4U0XMqPVcNNtxzeodImbEfaQ8QSoPo3babvW1KcsI0teX289hstzE
 96qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r+u1Uc4MpTFdNT8VK8aH808CBTf1BtkCYQRBGkAzTTY=;
 b=mPdRNl3DqA3XqNqs5hFyg+9EM8VhLkfdAq0gUnkEF1CtR9TS02Ia6L7JXQzEgP2BFT
 h+We0i57U48TA3Bgs8EWKgW9iDkw9QvuR8Mt7CorRAnnrfeREC3Rq3ZybOjyufxULPA9
 CFLEhIDBSQ7qyAAaQN6lt/19t4ETzX95+mh4Kma9TkE4HOXfVl0ryrBqR6lPH6EIZ7IN
 M518qIX28I5zHdl1B0SWILYaSVZ0ZctWPlaSO8eGPe0TtmrGB0BPE7L3NfTkHfA1Lj3+
 4wzJkl3R3QB91ktWPwEzM4cD5KyszvqvuscVM/W8dARrcilOmgDXnbwb3HHoa5G1UVa4
 bIvw==
X-Gm-Message-State: APjAAAUjO9hCNkHda3ps8rW0WYLio1d/lg9RlRlegBDXSePhVqKM4slu
 xpdz0FkfGXw4rxKLjto1sonLO2bEVvNyANO3NI0=
X-Google-Smtp-Source: APXvYqw5UxrFzLXn58WC+X6RPPz/t2StYMN+4m/MLVUAkSj0fMjagguxFrik34N/KANpNKFzVvAQAdQJ/qKByAyRehk=
X-Received: by 2002:a9d:5e90:: with SMTP id f16mr31089817otl.86.1556396972638; 
 Sat, 27 Apr 2019 13:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190423133646.5705-1-narmstrong@baylibre.com>
 <20190423133646.5705-3-narmstrong@baylibre.com>
In-Reply-To: <20190423133646.5705-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 27 Apr 2019 22:29:21 +0200
Message-ID: <CAFBinCB9WS650JpuyGyjjOE=LNbChOdhAyb+qJMYWGosyMUa=w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pwm: meson: Add clock source configuration for
 Meson G12A
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_132933_409093_98841EEA 
X-CRM114-Status: UNSURE (   7.95  )
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
Cc: linux-pwm@vger.kernel.org, baylibre-upstreaming@groups.io,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Apr 23, 2019 at 3:37 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> For the PWM controller in the Meson G12A SoC, the EE domain and AO domain
> have different clock sources. This patch tries to describe them in the
> DT compatible data. The two AO PWM controller has different clock source,
> but the first AO controller (A & B) can reuse the AXG parents name.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
