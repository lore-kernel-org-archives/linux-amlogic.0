Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9687DC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Dec 2021 22:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y7x4CCznAeng0E3LDWo/EvKVEBo66oEY27IfuKcd5Sg=; b=qcVv+xFWsCbdeO
	Q+Wd8DsG+l1kXw01SHbX/H3sEy35AJDiRzVGRG/tfumL2JnlzKbnOepzZczAsU0gbrZgBbC/p3Z9K
	FHUONL/Ek+hf1Xjd1wTPWrTd2/5GhclRoPXTfH9W2/awB+9TdnT78YopxZvhzvU3VFaYurUMECjeJ
	nND2V46OBOj5+2jiei7FIfYIlKoTYtFv3kNuFzgG1tO+3ky8/6lefTLQsnY67xOFKlKYHFOqi8mtc
	iE7KtYRQ6tD3yoA+cfXeQ0st4KZUgAhPhcpGNRnQJfEnl5zJRL5IHAMRXfMEd4QGZhfxoeUdWY6+p
	c2u3WGyPlgyURVKPl0vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3472-005MfS-A1; Thu, 30 Dec 2021 22:41:32 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n346r-005Mdx-1p; Thu, 30 Dec 2021 22:41:22 +0000
Received: by mail-ed1-x532.google.com with SMTP id l5so68307586edj.13;
 Thu, 30 Dec 2021 14:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Io66HcUiLdVjjQqfsG6ke9IYSCPIgdy83uGT3iFGDRY=;
 b=fKnkHOWPj9bJBcuLBDjRUjw82wEi6715Sv3LgvoYt2iPafs/3BjDjvZv/lsNwRVCIf
 UdOdo7kDBPKeU8jw3NIMRCMA19K76CPQ2gtywrpOfaHQbIu8u7BxeOKHjCdTtxt12lwv
 WIXS8D5YG4O+fhY4pOPlHkuFPoh1ErwgC0gfEA5hhis3B9IMPp9caigTWJzmK29t4YOQ
 3T78D2/ceYpQfhW3Z4OjEr/3OqOmIYcBzVymHls6nFgoezCFhkr9aHszJNyxRGtnOgkB
 TPUCM/4E+xhrKPwFV86csn3Q40lDwlVuY3IX6mAxzdXJK5jafYQTb8IwsJGGZmXDvaoL
 UYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Io66HcUiLdVjjQqfsG6ke9IYSCPIgdy83uGT3iFGDRY=;
 b=CItZzNK9zYfq4L2QtXRetY4uQA9V0EzayCCbPuY6jTe76NW0ZrtblBq/7j26wLPRGo
 m8xVg29cOHqXeWatLkAgqtdX/DtucpUMqYw+fxP7Me3+DoBBbuWlZ3NNUQIzCh++B23f
 Q38/w0g1j/9pPMrd7kqDeKoV9aCTGJ800dfa1Ip78mW2oF8dBkUnmOdSq+VkPV3p8eUf
 wNrBlwfAOuVGP6gNwKtg2OjYbS7b7kJ2pzybRxWg95Q6+w89dy9iSn9WljuYJuRzTo3V
 92Ilway1lpUtIJOPybur+s1vbEmU8dUL/DPqweoTOMxRz+1kd7nA9irvfrIe2z9GgvIF
 /brA==
X-Gm-Message-State: AOAM5306msk3m26oPRm2gbyu7JPDY7inFTedusg7StC3oSoVrYovjZhB
 A3qlDaYed5RLZPq4WK63sm8WluX/qvaWiuh6Ow8=
X-Google-Smtp-Source: ABdhPJyc3+8pKEBma4UIVLbyKZ0OwEGnDSbOQoseLj9oz+jzU13ksxDgRUoco3UPkmeVynlUMRu417KD4nrZocZsvx4=
X-Received: by 2002:a17:906:ff14:: with SMTP id
 zn20mr27176133ejb.649.1640904079384; 
 Thu, 30 Dec 2021 14:41:19 -0800 (PST)
MIME-Version: 1.0
References: <20211230102110.3861-1-yu.tu@amlogic.com>
 <20211230102110.3861-7-yu.tu@amlogic.com>
In-Reply-To: <20211230102110.3861-7-yu.tu@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 30 Dec 2021 23:41:08 +0100
Message-ID: <CAFBinCAzDSw6jmpU-S2KGZ32D+U1fNqLgKMmkPSdz=-XN4isDA@mail.gmail.com>
Subject: Re: [PATCH V3 6/6] tty: serial: meson: Change request_irq to
 devm_request_irq and move devm_request_irq to meson_uart_probe()
To: Yu Tu <yu.tu@amlogic.com>
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Vyacheslav <adeep@lexina.in>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_144121_138459_E2973C78 
X-CRM114-Status: GOOD (  10.56  )
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

On Thu, Dec 30, 2021 at 11:22 AM Yu Tu <yu.tu@amlogic.com> wrote:
>
> Because an interrupt error occurs when the user opens /dev/ttyAML* but
> don't close it, and then opens the same port again. This problem is
> encountered in actual projects.
I would like to hear from the serial driver maintainers whether the
described problem is a userspace or driver bug.

If it's a driver bug then this should be sent as a separate patch
(unrelated to this series) with a fixes tag.

[...]
> +       ret = devm_request_irq(&pdev->dev, port->irq, meson_uart_interrupt,
> +                              0, dev_name(&pdev->dev), port);
You can replace dev_name(&pdev->dev) with NULL to achieve the same
result with less code.
dev_name(dev) is the default value, see [0]


Best regards,
Martin


[0] https://elixir.bootlin.com/linux/v5.15/source/kernel/irq/devres.c#L64

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
