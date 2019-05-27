Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A65C04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:04:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3322520883
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:04:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PyMeedVC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="QT+oR2Pz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3322520883
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d9N65kCSsuZ+83Sioan718oA4FmdldI9bbzxZVZqb/0=; b=PyMeedVCOGNh7e
	qCe6g4HzRzSAdYbSAbW0udhmcfs2lbg0XCVE1M+CZpjsB9601VZjV21ZDqNAnnDDfRlrbIvX3SQUQ
	J+hniofC8UewO1ueYjI1VUG2litzG/AVG/0+MAxDEbBL8wID/1zAPcCL/YRiGThxMeasxV4yJrGhw
	gfGXbja8+NgeFxWkW0BntnGlZSos6PXSIAS7SiXvBbf2SfqM9COv59d0TGot0hajES0ZUSCC5tqlv
	RxaB/vqBDP2ziVcBUO38Tot1GAIbFRezx5jVVpTD8STnSiWXbLP4m5MhjAtdzuU4IZOrdI4Oo3VuB
	/eFDKM1ENPdkYPWq9vIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVJz4-0001Nv-G2; Mon, 27 May 2019 18:04:30 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVJyv-0001GR-QM; Mon, 27 May 2019 18:04:22 +0000
Received: by mail-ot1-x342.google.com with SMTP id r7so15485429otn.6;
 Mon, 27 May 2019 11:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qc5bwgG1nJlpiXW7qOpXYd6aZ6dtl7PwtbbKYJAwtlk=;
 b=QT+oR2PzBjtJAJ4Q9xeAgE/GB4/+a9hDfoejIBw07ZAUJYbrWe12KnBXyT6Q5/iLMx
 Ydgqpnjzkoq0HKSc3sdBbcj592NHjQe33H1nmmu3r2AaqZuH9kSEfW4X1IjSYDJ9MXCs
 KbWJxL8Yq3sTHtuZ/d8J0BUr3hat6BR4JI1NDD11dQrfaHGgkmjqml3BwckU8DYQfO9n
 NNh3Daph4Uerkcl1CE1+09Xt7BLTuLkxJBL/6jYBXCOXI9PjnH7J+ihDWH8uCDFjUnT5
 YkqoQY84Fl86gGlQtIxjqbqRWGwMcDNTQyFQcKnD4RXyGWWCskBQpIqLW0rWVIAxk6jB
 w55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qc5bwgG1nJlpiXW7qOpXYd6aZ6dtl7PwtbbKYJAwtlk=;
 b=iLx5fljQb93TPi/XSXmambd9afNPHgmurETPf8i0yJcdJLd2wvTrsRHQfUvU7HEtqo
 lrqdhbe381QeeF6sj4tj427IwP4xN+OCO5vjOUrvwIrRLkzWpa/lgfe2fbygozMZQpj3
 kpEhap9tXngJByUc6kI83QiBY8y36+yqSWr45P/upbLucMUX64pcbNp8vr4L+fMUYNvl
 qlQ1agpLB7ttsqX2bdVrrVfm+d3Z/vt0hdFu7mNXvx2wMgtDB+AS3wfVWt77CdN3+L0e
 u5EAtAw9kDDMKi691UxEeBCujla2Ra+qkCUxN8cmggvfIOVbr9g9RA0MuKcqspeoMlKA
 RBmA==
X-Gm-Message-State: APjAAAUnYsOG0Db65cOda97ckB6PhRIU3/+tMlkqAMU6QgmX7V8pLhSH
 FJRmwwpsQ1B/43vUwTiob1uUy/+nNcIbtxU7XsM=
X-Google-Smtp-Source: APXvYqyG/5Xo+qXItm0oFZccwmyw4v4GWKwCndcRrcwlFCngOkzbwFAFOT2+r1bf4fzOZCZjIfstm/Kj4oTQvjej1Yc=
X-Received: by 2002:a9d:744d:: with SMTP id p13mr50944036otk.96.1558980261008; 
 Mon, 27 May 2019 11:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190527134623.5673-1-narmstrong@baylibre.com>
 <20190527134623.5673-3-narmstrong@baylibre.com>
In-Reply-To: <20190527134623.5673-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 May 2019 20:04:10 +0200
Message-ID: <CAFBinCCD93XzMp8gbUUc_Q0pHt84=zyn3_TuPCVUpnB8LK48Fw@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-meson8b: update with SPDX
 Licence identifier
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_110421_857204_ED714C38 
X-CRM114-Status: UNSURE (   6.01  )
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
Cc: netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 27, 2019 at 3:47 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
