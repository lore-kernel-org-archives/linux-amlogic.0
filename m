Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B571EC433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Jun 2022 22:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O7ScR6RSkywYmcr0mTdwVQyLDec6/oK3teEiAUsmJsI=; b=Z2VE8gFvInN6jJ
	93PXCTTgHLNyHXeZZSuimVhNaG4b79mduNViJSJgzPw0MRolesrq+9EE52eAjkm/y4u7Y8nK+t2+p
	IOqVMhpfjdnl7UNid1mfu4aePY8CBbMlB+3ljw/1ZNpLKdaVJaz4+veKw2LZLSWvfAun5SG8vWh5K
	idyeABLRw9LMA+vLSDYS/fZwxhcZ4XIxZaHuuP2313rgOivmILrsB1DatDET02f47LpAH1aLRnjlq
	B8UMfJtVzRDCk9O/2nhE5o8tL1cK7s9teeIjTeTa95tL48Gnj8d1RFAJqzWEzifMA/4cTkPsC/zMW
	NkRCvFCOZoLVOKmFxw0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5aoW-00DsRr-Nn; Sun, 26 Jun 2022 22:33:08 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5aoT-00DsQs-Tg; Sun, 26 Jun 2022 22:33:07 +0000
Received: by mail-ed1-x534.google.com with SMTP id cf14so10618879edb.8;
        Sun, 26 Jun 2022 15:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F8k/W+Y55YNpW+5hRXZc8dzAY2Bfqx0VzAHHDvBJbEQ=;
        b=EvzVxegXdnLpT4J/m79ocqLBhfICA3aOveENKgLoHTw2PewgZmqHZnOIyXjjdpgpoD
         q4pRwTMX+1sNXWX9YY6+gdMpG+wMluN9CmJs2UQBpccf5/+lqtwf4FmVS1sUGysODiOD
         fCQdOtjUlBKnqoFGWf5tpVOFFCcA0No1aMFAmlSwUVM7eRt7qBY/SYMlrgUyZW2EJ2Ju
         afSQFxf7TJTlNqRsecYmQrm+75SGqFT1EmvywuDZe2H1c4cvO72OE+ehHcltGNl8lckk
         IPq9J+wKuY2NoOD5IcoNljty1ZOyC1d80Hk+gsVvRhdesNfr8YYN10wioSgrZ0wZpYHR
         ll6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F8k/W+Y55YNpW+5hRXZc8dzAY2Bfqx0VzAHHDvBJbEQ=;
        b=c4mwhSH1YG+ffXb8jy6XGjl8lQTcJHoGtDeZYAqxTD8fU5G39fVlcTrEmesH+7SCua
         9na4XV/itNXofGVx39SK09foOaHzLtGyCoy3kEa/M5QRsJUEPpl0YXdevhToFtJlTn/0
         wzqHSjQsQxRMiEeynlQsE0VOJ/xhzHkYTH4KccXhfQ05jC4cC3DVVFn5Syf7SAkIwaAu
         QDXSDsW+awJw9f81jK8cvAz9NiGTA2OsOpG1qFfWjq9vzetAEVRtF7GEbzd5IY1h9MA0
         4gTkV6CM7Bp/4cZbXi7Tf0Kn719gqHm9gnkVH+hqc54LMK60FGN5ZtqoayBNdOMFnjs5
         5egQ==
X-Gm-Message-State: AJIora/IqZXzDD0bQ4vfeoLqtZo7ksBLzD5gvn1hHSFGeY4wjF+9ydNA
	8yZGAopiP5EwDkUDu6As0pSxSt/dEKTrVdKmkJLGuMYY
X-Google-Smtp-Source: AGRyM1tllWJ+xUlV0MtVwcue9xV0he/QRwjFk8QXLH+yTZ9inE1uvC3fO2UW4H0Avwx7eoYrlZg6ZCtCqYNHHS9gr5Y=
X-Received: by 2002:aa7:c542:0:b0:435:75e:8a7b with SMTP id
 s2-20020aa7c542000000b00435075e8a7bmr13122141edr.108.1656282780812; Sun, 26
 Jun 2022 15:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220617072723.1742668-1-narmstrong@baylibre.com> <20220617072723.1742668-7-narmstrong@baylibre.com>
In-Reply-To: <20220617072723.1742668-7-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 Jun 2022 00:32:50 +0200
Message-ID: <CAFBinCB=RJeaqVi+d6gGAsQTWAU68iFF6T9bXAQVYUWKxgiYaw@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] drm/meson: add support for MIPI-DSI transceiver
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jagan Teki <jagan@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_153306_013485_3ABB632A 
X-CRM114-Status: GOOD (  10.02  )
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

On Fri, Jun 17, 2022 at 9:27 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> +/* [31:16] RW intr_stat/clr. Default 0.
> + *             For each bit, read as this interrupt level status,
> + *             write 1 to clear.
Do you know if an interrupt line from GIC is routed to the MIPI-DSI
transceiver? If so, we should make it mandatory in patch #1 of this
series (dt-bindings patch), even though it's not in use by the driver
at the moment.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
