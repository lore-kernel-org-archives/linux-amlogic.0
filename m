Return-Path: <SRS0=z4cL=K6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C83E8C07E94
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jun 2021 09:40:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 908B861287
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jun 2021 09:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 908B861287
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BO+9qjz1f7cHeGPO0rO1rmrTjIpBrpVCdD4Vdv9lHbg=; b=cglZ4a7+z43K19
	DIAnnSn5sEtnemeEHIVz8EenEbXr/EZOEU0SYuWLTWxjtatq/V6CtvrmPLWnT9CCCELxuCWe149Sn
	NT33zuFrQUf1YvINrETQvc9MDUMHRvEIwlnI/IotBeiV6Z8mduCeM5+TSZV7voy2ad/N/dr1PoYEp
	H+eQklkauj/HI1h66cFa5pc7vFkjk2WsoJ2fzw5JDwgAd8beRZ9hlQXP1rZOJvzOXk2o8WHr3ZOYG
	A9Fp/gXdQLVry1oSUj/uhIXFd6ddtCoeGin1U38mfkg4uLHRjsc+Q6BDiCpcEItgfiyFdZBkLcR4p
	BEKWFQj421HhjZYsHqvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp6J0-00CgSU-IG; Fri, 04 Jun 2021 09:39:54 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp6Hs-00Cg9t-A9; Fri, 04 Jun 2021 09:38:48 +0000
Received: by mail-ed1-x52f.google.com with SMTP id cb9so10424095edb.1;
 Fri, 04 Jun 2021 02:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MhKXBp+zBZD4+PQrRnyrXa8bCID5+ELNG12yKRayxeU=;
 b=rV2RApyDiLp02f1KBrG2aGTBpbJkGHOPuhv53BpTBLR+5wp9uX7giCBypVeSytRTbv
 1TqGEsgJb0AgsSg1cVYZod+ZCihHs2id/DgqhRXqX0WjkNr12dxi7A3d1HQVK18foD6r
 5301LG+2tmvYcpkBMSYkrIBxt8JFXl3y/MdFS/r0VsTxBQmSOy+SuK/KyFiG8+j+GnT6
 XzbztuTHI/SjRNrEAxi7KuXQHErvziU5krr6HMxc8LTvFiTYkvlhIO7SHCUqC8oIKcQ7
 JJS7i7BvatplcuCHO10WkIHJCmJIxPP9DrUM66I4KGTwuw0GUz4L/2Nu0gQ7EAx+8Joz
 3WTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MhKXBp+zBZD4+PQrRnyrXa8bCID5+ELNG12yKRayxeU=;
 b=p0b5HPU37U6FggZZmn61Sd3QfJo8yBh/1kiW2Dkoqxn4Rb+IaxWx3Wr/pRmKUIR7n3
 ky5l5yPGM3AS+siFebGrGriNXrk3ctotGaxPav+SJgdSmkvSGD+FdelRWDcpgynwOb6t
 48gsFyZ/0OIbMzyq90iAlP0E/mYSyWkUGnlBTSBZKI4Rjgow5pobJT7m9RRA4c5OuKke
 tfDUObVBBM/8cPhYSG3MzabzjSS+nEObD01D2ryrVLvUYY8C95uQJGPX10/n4nfEFLfR
 nHbeI2cjxGUvp5nKbj3zYN0I24JEEtaKKpuUNn/yB/WlccTF2dVCQ526FXU7XJmNvvS0
 beaQ==
X-Gm-Message-State: AOAM530RTePuNP5DH496QWKL6umnRDyX/2P3hX3b7RaZ5IXxq5uAOsHw
 V2cT4YxMyUQpaTJdbjazrRuO4bpdl1rrmdJsNCU=
X-Google-Smtp-Source: ABdhPJxYes8F7Qb1r/i3YJINI7YG/rb4qomsfvplGMIFqj0vdnJFvju0RA5//BY9POtWG/sxD3UxS/sxizAb3u++8Ig=
X-Received: by 2002:a50:9346:: with SMTP id n6mr3683387eda.365.1622799522509; 
 Fri, 04 Jun 2021 02:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210604032957.224496-1-xieqinick@gmail.com>
In-Reply-To: <20210604032957.224496-1-xieqinick@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 4 Jun 2021 11:38:31 +0200
Message-ID: <CAFBinCCLn+H174oSh+U6ARknDn7LFgN9QMHRdN2L5oSw2bcafw@mail.gmail.com>
Subject: Re: [PATCH] clk: meson: g12a: Add missing NNA source clocks for g12b
To: xieqinick@gmail.com
Cc: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
 mturquette@baylibre.com, 
 sboyd@kernel.org, khilman@baylibre.com, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, nick@khadas.com, artem@khadas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_023844_416826_4C85B07D 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Jun 4, 2021 at 5:30 AM <xieqinick@gmail.com> wrote:
>
> From: Nick Xie <nick@khadas.com>
>
> This adds the Neural Network Accelerator source clocks for g12b.
>
> Initial support for sm1 already exist in
> commit 2f1efa5340ef
> ("clk: meson: g12a: Add support for NNA CLK source clocks")
>
> The sm1 and g12b share the same NNA source clocks.
> This patch add missing NNA clocks for A311D (g12b).
>
> Signed-off-by: Nick Xie <nick@khadas.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
