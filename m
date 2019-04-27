Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D3EC43218
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 20:29:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB42B208C2
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 20:29:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P7iqiwQU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="oZt/Gnkc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB42B208C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MDuHrN3gsXkMlK7kI523teXOZWo6q+wlzNNjKrUfdIM=; b=P7iqiwQUwrNNnn
	j3Gt6j8V9I/invi2sX4V6r5qmN4k5qj86E1k3txRtSx5cbyx+m8NqxY207AW/5YquW45oI//ImW3S
	SiIK0KjyGlxOTlHgOoTT4ZOQzg0Z4Ns8TFiGBCeM2J4KTwe5iLk/1F+ikyb5iaijhpioUAmb9JDz4
	vSs5T2U9GiM+M14Zu3TU1wNZFQoS3HUVmnltjKdi3km0OEs34S1qhKqc1R+G0nkZkVoBPsAnx2vuQ
	ryXViBwKjHAsK62180LB8EMXJF7ISwl2d/ZZCnF+3ssyz9w5+2QG38xMF4IGZn4h6y9V76hr8MdqW
	HHBXnVtM0L99WBxxgUfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKTwV-0004Zt-5z; Sat, 27 Apr 2019 20:29:03 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKTwR-0004ZL-TX; Sat, 27 Apr 2019 20:29:01 +0000
Received: by mail-ot1-x341.google.com with SMTP id g24so928763otq.2;
 Sat, 27 Apr 2019 13:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1I/Om5aYGl76EBPQH6xJKuHTrTxYjP1lSZQ1eei4PnQ=;
 b=oZt/Gnkc+JToAFtKFJv1xZmlYzkiWRGIOyqmO8G+34CGuYKdi4NWz8fdSSkNVEEb+c
 PfyUjCXRBE34YNs5xgGNjJvWCgpvGJcr3hckspV9eKrbxGLtovbs8yX7BKZ6cIcCSB/F
 Gf0z2NeqiV3UoH5896Pa1Tz+EMgMMV0hM6rcQkb993GVp9LdNcspdjkzcXpSxAKwSpmB
 mCwxPEpDxJ6cfb7j2eBlrXpuwSftsW885V0vkz4rWZhz+44QoNoFKIV6c871cFdgP/tx
 sTRWZF1GCKCSvJ9plNIPU3VKh3FReJ8jmXx2u3YaGGaYIuXVdTCLcnxoCYofiXm+iS5T
 81dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1I/Om5aYGl76EBPQH6xJKuHTrTxYjP1lSZQ1eei4PnQ=;
 b=HnmqLNUiPAfhm9AGljrt/Q9GSYoxGhaEQPYKMD7LFq7Thn6SDGQ7BLHHerumRxp3zl
 G0x6Soi+XLlJ7ZAomkxetMy376U6ymZtaN0yMfTUugdHRgWEWYoUvu0mqTZFgIEyzd0T
 /G5w5idE+mdK+X3lrsxPryvrIK8P/FdljSG8FRxIegj0SudlUqDO3Kk0Wkfw8hdr21Ot
 eWhDJsX+qB6a3/0Qsofe3Ltzv4+87gFFkLuLTc3F6WCrSabBM459I+/MIJ7RZDVW5YDY
 jrZFXFJ84IAXRyQhnWWGxDXIzphQ9J6q1MJkXyxTwmv3Df0tKg69/lu6lGuxaXXfGDZ9
 6+rw==
X-Gm-Message-State: APjAAAVl3CgLJLIo6/l7OT9A+zm77XqmVavVaQ9VmjuMhFcYIY0URBxJ
 PvJQsF3xbtXKb3yoxCmG74jNqBmKfI2hyQUa0PE=
X-Google-Smtp-Source: APXvYqy9mase1ZnVcKmBnICOyv3t+KT6WikFCXT/0YPXUrGRlfZICYalsHFMC6sfA6xprYjrwUMx37FrmRKsqaItP8E=
X-Received: by 2002:a9d:7443:: with SMTP id p3mr11906227otk.148.1556396938787; 
 Sat, 27 Apr 2019 13:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190423133646.5705-1-narmstrong@baylibre.com>
 <20190423133646.5705-2-narmstrong@baylibre.com>
In-Reply-To: <20190423133646.5705-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 27 Apr 2019 22:28:47 +0200
Message-ID: <CAFBinCC2XpRab2Hqb+begpMYFuo5KhWfwemQ6C_1LqxJbBjYxg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: pwm: Update bindings for the Meson
 G12A Family
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_132859_954920_131F309A 
X-CRM114-Status: UNSURE (   7.17  )
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
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 baylibre-upstreaming@groups.io, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Apr 23, 2019 at 3:37 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Update the doc to explicitly support Meson G12A Family.
> The 2 first (A & B) AO PWM uses different clock source than the last 2
> (C & D) AO PWM modules, thus we need to differentiate them.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
