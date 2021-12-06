Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11EBC43219
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Dec 2021 21:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bVHxqZgUJ+WENT2TKbdfS/Jnlemv2siNUBrJ4kbrN08=; b=Sz40OETSF0cvlj
	UfazYHK1FXm0aI20rQKgqwRYqmoHl3Avemb1CHC+CKLkXGLoQ859c1LUFu3vkpoUPkt7uGoKS239P
	S4DwSh+n7SgSMxE6BEcQ1TiBqy/7EYGlO60G/e578yc+a8x1zIKtsg2z4JWYUwGdWnR4Ry8FR1gvw
	HTXIjBOucUhzkrgpEbmHS04OBLa4pIcLFMTURaVthL0SMndcUBh/+sepljNdDiickbPgHdJrx9xzu
	m5m2nuMmo0GAJoCvdjo3kyO6KOwp0bSXedz3hPSSdbUa07xFNMIPHE15BRmqPD715VS6q0jhWbLdd
	pjbW8lWM+Uv4ABnOWbHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muLN4-005oSh-O6; Mon, 06 Dec 2021 21:18:02 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muLJP-005mgq-Pa
 for linux-amlogic@lists.infradead.org; Mon, 06 Dec 2021 21:14:17 +0000
Received: by mail-ed1-x52d.google.com with SMTP id x15so48709582edv.1
 for <linux-amlogic@lists.infradead.org>; Mon, 06 Dec 2021 13:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Co9V75bhJjlnXQzibNJsjv/WAUqDKbvzqNnHzf1Eeho=;
 b=KHY8xjlSX0x30xhsYg/MqcjRFjhPPJmTS8WAR2Q+W7zdCC7Xj1d2LLz74MYGiY4tiE
 qK7jOzS/B4Irfg55ixv6DFNZKWnrM0lVOLoUSd8wOCoRuFbUsoIH4nz6tdjgWWBuTeV5
 UpoGxAQ+j5+H8x0HIiGjA/zr1HiWQlD9Ji3W6pcZMzY5gNe2my0mBt+C2wYOrYCvYVhM
 /MY8+SCbRkh/7hHNbiTxVa3NoAk0yrR5ZKY7jnJfacaCpaCg97hyqOxyyBQJGOeUG+sG
 CzXTfdjRqqz84qtkFmmtsBTKRa9rt1y3lawvuwCmQy9HqVMnwOByJqQ54lqJS/c8X7Fm
 HIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Co9V75bhJjlnXQzibNJsjv/WAUqDKbvzqNnHzf1Eeho=;
 b=ol9e9lJaJLIYw4hGBKmezZPzLUMqp/Pn9nZ28izRiAiTthf4kKBQygQUnR5nHDagLc
 UOQrX3trlGqk/QiwZXYbKJ8I8ZV0LGH7JuQQtb8QawcL8EbToqoqxXRP98/hJuQCYhkE
 4tFwVQQtS2zMB9NCWbP2KQYSWD2qCL1fCMHzX32VY5VSkAr1UPjPXPYS/sCepHmgz9aJ
 czK1JdyygQAuVULoviauYANEcVlBl6kxpQ19eGHv9pd8AjZqSvaUk+PBpX1XYmt7t51E
 X5G6Ukl0sLnkJsv3CKh93uiePsduovUGRjOhTu8UEHwZs4sE0DMN6flYmoQoUd0vWUuX
 ItyA==
X-Gm-Message-State: AOAM533q8VVMUC9VjzjxkvHpT2BPs8Y3h2dU2SgwTdk98SK8b2CnH+KO
 XRXpuCcrDSALyRhjBz38tJV87ey6Ru4jVkLOswHAlGJgH0g=
X-Google-Smtp-Source: ABdhPJze26tcSbr/g8nCxQAhS+VDeJWJ5k4fF+PXDNELrqFtXe89/FZeJqgXCDLPHtSW8Q6sRxuv4ZKr24poy2z6AgA=
X-Received: by 2002:a17:907:6e8e:: with SMTP id
 sh14mr47367635ejc.536.1638825254184; 
 Mon, 06 Dec 2021 13:14:14 -0800 (PST)
MIME-Version: 1.0
References: <20211205215846.153703-1-aouledameur@baylibre.com>
 <20211205215846.153703-3-aouledameur@baylibre.com>
In-Reply-To: <20211205215846.153703-3-aouledameur@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Dec 2021 22:14:03 +0100
Message-ID: <CAFBinCA8EFHhUnuPQnMKgE5JLF3fYD34Q7DOg_SP7qSkNrdOyA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] phy: amlogic: meson8b-usb2: Use dev_err_probe()
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: khilman@baylibre.com, p.zabel@pengutronix.de, balbi@kernel.org, 
 jbrunet@baylibre.com, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_131415_880723_D0E49E1E 
X-CRM114-Status: UNSURE (   5.94  )
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

On Sun, Dec 5, 2021 at 10:58 PM Amjad Ouled-Ameur
<aouledameur@baylibre.com> wrote:
>
> Use the existing dev_err_probe() helper instead of open-coding the same
> operation.
>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thanks for taking care of this!

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
