Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD4EC04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:07:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9675720859
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:07:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X0FebNRg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="c9/O9xDn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9675720859
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1cBwer+NCFMSMvNM8Eo8QCGQF3ayqGJhpyRDLOVJzg8=; b=X0FebNRgviVnxo
	rWdA7Ixa+RV01ndgVTlX3CY2JwLXKtksv4f1Dek+oV8Lz0IL1quEnmy3SXhmb8YX1yLRYTPD86nkf
	P2C4oYIBtfxOkFtkM8IooWT8ll8CgWuU/2mSbKE0a64/kC8rod/2fNAAY5ZmJcJiPWIpYjdV2YU1s
	bLj5LctXRrNs48WnmRcxtZ6NZ7IouaCNy8W5E9Pg5ahr8Qc9sBrCwRvsX1Vw5nui467vFj44sNXmM
	IxlzFiWvT8jfJilyOJM9/cZIS+mP0lvOrKBfSLQgXHDJGKXRVlnKxY1fDwcP8MA8ssabm3JnI9Nn0
	JvsDvlQ7tH+gMmoyGv7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVK21-0004eI-Cr; Mon, 27 May 2019 18:07:33 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVK1v-0004Ro-Rj; Mon, 27 May 2019 18:07:31 +0000
Received: by mail-ot1-x344.google.com with SMTP id c3so4223373otr.3;
 Mon, 27 May 2019 11:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Go+cEvT6712i8SHCbemtxGqeOx5oRlOrOPZ06KB/6pI=;
 b=c9/O9xDnVa9qfikYjzqlRoKsnQFQ1aK7GaX4prunNHFVQi9lyKXEt5whBvlvqgwr4f
 MYJkoXO7aqsBngJhVDNbzgA0Xm/zPG0qgLojsI+XMfq/iCMDkM85hmN3YGyxcsAMa7Ru
 xGzJ0OFpzGTbs8pgA5WpQROAKPkqriqTI2MldOMqetEDIBG831p5j/elghOt6riHpUDA
 NBpSqB4w/o6MuI3CfXwfu6/BvCmI1szXdEnrBHgLEN+sBKmYdyRQwZwrVj+EEvpykBCF
 KMleOxni2gdGev/Vt1r2ZSn4iALPh41VUVUNZFgWJeOwL2IUUBTCJXMn+qaImEB7hmWx
 mLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Go+cEvT6712i8SHCbemtxGqeOx5oRlOrOPZ06KB/6pI=;
 b=rVIe6qyIcnC4OCZEMEaCO4yHtJv5sTHgfCYq8194eQzP99lSJp54LsZyx79sQj6qxN
 /eSsbmL/VqE5kyNl5VOq1br3TVkhqyzFkcHMpx8DLSdkzNs3o4KawwbGUdRY7Jc8WY+u
 gi8xQNSW/yW6St67iN6OleQgxC5TSuU1BMOFVZbkl5eZho0VwqlP5tok5Rpq+zIrhud/
 opHQB4kGsrbq9RejPk8lqjm0uz6BjUTBbzBjtw55GBg2WQuAXuxPqvyShUbnEBz5grxb
 AAgZlzEfAq9aiV/N18kNN99ulL2WRdMUleQwcxgXfs1wyV3pSSESqlzJ/bxhPmNZZMRD
 QbRA==
X-Gm-Message-State: APjAAAXMvtM4xZnyDU8NF4OL556QxQkoSB0OJP7itNNzGvJ3UuVliqCb
 CQ9MKAJypDzT/HiHqAXfmYsdliLV8ITCX7XsO3e7c7XP2IA=
X-Google-Smtp-Source: APXvYqz/9+0ObAJ5pB6MCxeVNlNEP+TlRsEgZaxElNO5sPQsDcX55Fk2AEf9l6nS3x5OOn4JdfLsG7SfFNWlMdQSOUg=
X-Received: by 2002:a9d:7c84:: with SMTP id q4mr2118953otn.98.1558980446983;
 Mon, 27 May 2019 11:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190527133857.30108-1-narmstrong@baylibre.com>
 <20190527133857.30108-7-narmstrong@baylibre.com>
In-Reply-To: <20190527133857.30108-7-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 May 2019 20:07:16 +0200
Message-ID: <CAFBinCDCvLUHVvk7q+1dJ54mjrGyNfaGDfmVCNeMns--s=nj-Q@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] ARM: dts: meson8b-mxq: update with SPDX Licence
 identifier
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_110728_015324_29365234 
X-CRM114-Status: UNSURE (   8.29  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 27, 2019 at 3:40 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> While the text specifies "of the GPL or the X11 license" the actual
> license text matches the MIT license as specified at [0]
>
> [0] https://spdx.org/licenses/MIT.html
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
