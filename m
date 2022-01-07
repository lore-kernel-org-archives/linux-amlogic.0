Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC08C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jan 2022 22:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nxG3BUfziB/BfykOpgmsyF6wW2LzT43o2ADzRbZA4GA=; b=j2HYwtIQlEyu6E
	jg8YE5dzbNBYzzJN/bT6pusXCUpERlKanYESrn6yAOqhb8tLtfgQi3oYYHX3Snbuz9kkFA7mJ/iig
	JJrfTCJp3J0p0f089CpOCce9E4mb4s1txCnxOWvxoMxB6VZSDZRmPFR5g28qGvwbQGaO/rFO/qAt0
	AlBXbA/65vnQReys3QHVsJvGDPmPCI4aXQWvc61GeUh5wSUGpo5uErfAq/1gSyYzyb5MM00mcrRyW
	uOSbr5jx+V+pA+6JX6DB5+ICNw7HVwvE2oNnFzDSopyP7besH0L4tK7SSEsbT2MIbXNhpn2hELN9K
	t0FG+dqcA3Kiv/bb1TyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5xpb-005Pd3-PV; Fri, 07 Jan 2022 22:35:31 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5xpY-005Pc4-7Z; Fri, 07 Jan 2022 22:35:30 +0000
Received: by mail-ed1-x52c.google.com with SMTP id o6so27452409edc.4;
 Fri, 07 Jan 2022 14:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sJrTOgh1BpphQDyMp+sJajflfyJjq+t21DzU6lHdSU4=;
 b=JkyBZUD07AqOXQSj7I8GTf0fX6mcjJjXqOyObGc+r3m34mdWfoNu30bMbljR9Pf7dV
 Rv+++kSM1kEVlTak5gMIG1j3/46RspfbXH/cRfXYojy9DkYhhY7ziVjkfsrnJJVtPz9Q
 wiWrQTg0l62jPRjn80WzmAKjOWXCeEcAM7NuVj3ZTf9J3pNCUE2di6ZL76uILIOQnoEi
 SuIHrUr/veOipm4qCcmDCwsRLKI2Axtz4OrRsFqCLy8OQ4KzHSutJLcviK/r65RKhUFP
 ljjO3ZN9MTKdupmsThe7THG2LJKq1SEJ5nK5a69Cb0o4g2dYwYQcACZ6XEvaBYEORkmt
 +HnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sJrTOgh1BpphQDyMp+sJajflfyJjq+t21DzU6lHdSU4=;
 b=JOKBUj4MIJi+VMTN+9KJl5nKLnGhG1rLFvhu/FNHh5JlhXj6oB5yrolfdaarZ4iI9S
 PCEkdiFRV1TT+MGXpT2Jzqkp6vSVrCNSwAZeFlpbinHox6Yp63u+U32bmCXadEE6NaOh
 Pa/lxxASWzJaLIER4hJp4agUg4wYCUHIZCSmO5ADL5RKn1gdlXVgVR2ihDRwedJhY3eF
 ClylfkFgntav6khjOL8re1gSH6roX9r6a0fdZa16D6xvKGNBdlBpl4BYJVGsm7yKTsK6
 1k9Wn/cxo8J7bSQVI294lge6ZHrVvnG7cFYxVyMW6+Rqv6AKqZUfKKK+faubUfLLM7mI
 xHlQ==
X-Gm-Message-State: AOAM533bq2O7anGwwMGCIidWMylDbPp/sm0SlKVMRwoscqUt0sI/rWI0
 7bs7HkJh2TjbEmd+ptKVydi/zg2mt6GXgV/lZ4k=
X-Google-Smtp-Source: ABdhPJwWWj41v92H/MlW5O+b/Fbpqer/i92MXxrWRNrU7ja6rVWwWcPO1NMu7xJe2swKrRQnVOjVtheSWsg41w0MMsk=
X-Received: by 2002:a17:906:519b:: with SMTP id
 y27mr5504426ejk.649.1641594926899; 
 Fri, 07 Jan 2022 14:35:26 -0800 (PST)
MIME-Version: 1.0
References: <20220107145515.613009-1-narmstrong@baylibre.com>
 <20220107145515.613009-6-narmstrong@baylibre.com>
In-Reply-To: <20220107145515.613009-6-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 7 Jan 2022 23:35:16 +0100
Message-ID: <CAFBinCCR4zftkvJWgX4T068BRsjVp9YhRbzgdBOR+tuMcGSZ3w@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/meson: add DSI encoder
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_143528_299191_EAD4B59B 
X-CRM114-Status: UNSURE (   5.64  )
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

Hi Neil,

On Fri, Jan 7, 2022 at 3:57 PM Neil Armstrong <narmstrong@baylibre.com> wrote:

[...]
> +       writel_bits_relaxed(BIT(3), BIT(3), priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
see my comment on patch #3 from this series for BIT(3)


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
