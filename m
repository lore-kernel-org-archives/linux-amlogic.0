Return-Path: <SRS0=rBUq=TP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D3FC04AB4
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 00:16:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB1CC2082E
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 00:16:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CoNaDvv2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CQMSu4As"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB1CC2082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5tKByXmFTmckiannohf74N4LcJx84hIyIv21RPRcVCI=; b=CoNaDvv2hLcILJ
	b9RurnfAZLhw6ZPlzRRhYt9Zr1AxNL8K9y99GL4ftApqlJ1Sl4UEuCcmTL+BqzogQCnUGPux9nB17
	J410sByOMpGaQtEDftKLRuLI0NekCPXmhlyq5XSYGP0snwCVecSqyADxuRolqDpjRVZYV3XY/Oa1N
	H9eCstTnrRwQVW3urdc7xlu3vyL7ilpkWFxFjfzFifpRv22ieQV81o4dK+bPcJEduHyQ0ayRm/21J
	Vz3heycqeAnUtCcEliaNH4IbaQHCPugv1VqTx760k40E85sPWQERLSLdGxkS7OH/Yhk6FrJ28eLc+
	A6FofemTiixdlWQ+7mDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQhb4-0007VQ-S5; Wed, 15 May 2019 00:16:38 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQhb2-0007Un-Qe
 for linux-amlogic@lists.infradead.org; Wed, 15 May 2019 00:16:38 +0000
Received: by mail-pg1-x541.google.com with SMTP id z3so373931pgp.8
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 17:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=0Ng7RtwdZZGuEsOpcg/j6BSGX6h3Rm/jbhnAJUw5oaE=;
 b=CQMSu4AsDA4jTq/54A4Tfxoci760WoknUl8ChC2k38YH7PvZ8OdcZ+iO6irmFfaY1x
 JBW6jiuQspi5NKeF0VXIZYfFbjWBDiLdW4XsozqCn9NXmtHTKqjKeZ6xYHlkozvArdvC
 auOtVUnxxgcko7dyxSUJNG/8/rQQBm+O6olu9tEkCgzY3KAmiLe97DsxqQxEnl+v4CIe
 xfwNQ6MfSETkvvm3woIMq9IDxGtD6k2JJ/mAfkFj32c8YOQrPuGu4g9j2SXVsTrrL8we
 dkcIWgqRZGYw1mcAIN4fxwdSI4pz7T81KWtUp0JNdfE9Sqvao1OQYElpARhaU9qjzjgb
 /qtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=0Ng7RtwdZZGuEsOpcg/j6BSGX6h3Rm/jbhnAJUw5oaE=;
 b=cOvosmvRu2fgov2Xjf9hGhJN2a02UQB2Kkkyi5wjRg68u3rgBNWpel9SJz3AuVSkn8
 NUPD2wnH10/WOl9VYXbBToK3q+qIURfhcgHa877JIsErLoeFnCiMDD+zHOEv3CZepsvf
 bixrcmoQqr7foURd+SEMGcK/ElRHfUfcIAASxZqDmxXLLBdI9/1jvUWlW7ej83R+quA/
 M4p+qIpznVOHP7SW8MiXptq3JSU7YcectfYnXXPRITZKGAiJEwhwl2mZWtJKUZb1ZneY
 373kTxeqdkkmdP6BzLkwhDEj9oqdRaD9QzGZGEVooRcwxELOlGYaylC7bxexggyJrVNw
 lEpw==
X-Gm-Message-State: APjAAAWhIDHJBKGSLAzLPmpRtegyPV0xevjwyyI7wRn0ls3ksODQ0oz4
 JWlMxUyfwritZQvOEugbDVhmZA==
X-Google-Smtp-Source: APXvYqzFwnBn+sqOHE9J+Ttd7yMS5W9SdOmBxM99N/CXH4wDHfqTN8F/beBTCzSL6fy1kvBb2ikf7Q==
X-Received: by 2002:a62:7610:: with SMTP id r16mr43793256pfc.69.1557879395077; 
 Tue, 14 May 2019 17:16:35 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:fd66:a9bc:7c2c:636a])
 by smtp.googlemail.com with ESMTPSA id v6sm253690pgk.77.2019.05.14.17.16.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 17:16:33 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: nanopi k2: add sd DDR50
In-Reply-To: <20190513130507.22533-1-jbrunet@baylibre.com>
References: <20190513130507.22533-1-jbrunet@baylibre.com>
Date: Tue, 14 May 2019 17:16:33 -0700
Message-ID: <7hk1esd126.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_171636_863643_A83F1CD7 
X-CRM114-Status: UNSURE (   5.13  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Add UHS ddr50 mode to the nanopi k2
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Queued for v5.3,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
