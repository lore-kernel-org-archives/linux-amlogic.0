Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED6CC433F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Dec 2021 20:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZlnZ8AAM/UGmkyEOOfkeliDWepRd6yGvfVF/WFCZtoA=; b=PKuSi7ILYocfhb
	L6ea12AISIIuo+sYa9prigTiBbQSARL7I6t5KIsHwLIbvg9z9YftVC7Y9shvWuj+r3bQ0qtn96HkP
	MBv/FBZHtg+U7L2XLgsQj4OLROKSxRUG9QxsflCfrBMMYYuwhXXM8jvXjib4vSAypN1AdR2CjFowb
	7Vtv7O7r0McoBcufjZBiFiwb/3ZTrj+RE0rry1BBjM6xQ4VTNZXkf0rAhmZPetlu1p7PCrIa+79ru
	s5PRbwcH8bgHn9a7KmPkOkqxlohi5pSXJpRC3VVzho7aPsbYVDZeQfTGInnebjsRTIedO2gAfDerb
	FTSKGHo33RP5mkn6CK8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwVhV-007E6C-GV; Sun, 12 Dec 2021 20:44:05 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwVhS-007E5P-Io
 for linux-amlogic@lists.infradead.org; Sun, 12 Dec 2021 20:44:03 +0000
Received: by mail-ed1-x531.google.com with SMTP id o20so46450953eds.10
 for <linux-amlogic@lists.infradead.org>; Sun, 12 Dec 2021 12:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yP2O9civRRxQtY3Lz25ifh6I1U06VEYbkYd4G8hA+6Q=;
 b=EVCFPAzeNtIR4NLQweygrDcmmZDGq3eOACnKcs/hfw0MqusEaudP1EcUZUf6LLvHam
 nS7Kz+OzkwKm42WGeRqXN6qIErYf7F8FF8XKjMUIN1VKuT4zCA2bVfnTpqLzgOTied4F
 +ZLUP8EkuF9LJAPqG4Ry2jnTRbxkqm1lApeK5lMEfiATUZZ5vWm3FSBwVBMoYKohcQf2
 60u1/LzACjJYBLHIXvxtVuPs8iaQQwDm0oIW9xettkTSj6txiFzpJbNYVaeezw775p9/
 blJEae/WAdiqQasK9wGPpD3rpKvW0GnEPOQ36X2lUvg6qvPaGjWDeQjymptnwp/5OIhg
 3QiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yP2O9civRRxQtY3Lz25ifh6I1U06VEYbkYd4G8hA+6Q=;
 b=ZEHyPhze6lao5tMK7MJfxOM4DwmMoyth+GXmGvkuODUSM+v6fpQ14MB6reb3dhYHix
 l/d3dxDNP38unCIgNmummMFDK7ktYMA6N/fwi6Sl/VM4lXSY8SyAyfDuRGCecSAw4lVV
 Dy3y1O0iqaWVVvYT/IQJcQ2o9ShDL34q8kUehOKulvxoBSeHNtD7CzGiSLLndhdLZM+d
 fEYBDLU0L0lRCjrYKAPQp8Jwew6u3Vqnhg0oM0uCZJbc9maDn3bi2Uez/sRTPWlhEG+5
 O7LO42uruSnTv1MdhWrnC2PWoryJMZAqTdERcB5IPCnDJE7Q69mbDqwN16eb57yMwaXr
 1+9w==
X-Gm-Message-State: AOAM530XwoHulv753mzs9cMjnzYLMio/zWw/K44Bg7GKgcsPzYwiGfs0
 uq0Kdj0oeVeA+GTs9I9LMhfG2UWT908Z+xWrckk=
X-Google-Smtp-Source: ABdhPJynDnAdk3DFucCVq3HNgD6bpcw0wB668tsm6h4tMO7JBDvph4oMhm+3W7hax5atapV9b9iXrwZ0zPtk0x073VQ=
X-Received: by 2002:a50:f189:: with SMTP id x9mr58742036edl.95.1639341841296; 
 Sun, 12 Dec 2021 12:44:01 -0800 (PST)
MIME-Version: 1.0
References: <20211212201844.114949-1-aouledameur@baylibre.com>
 <20211212201844.114949-3-aouledameur@baylibre.com>
In-Reply-To: <20211212201844.114949-3-aouledameur@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 12 Dec 2021 21:43:50 +0100
Message-ID: <CAFBinCCjrKYOjUsJZ7rPan-0XVNMU0+x0fUS1Wn_bNUXxqBLdQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] phy: amlogic: meson8b-usb2: Use dev_err_probe()
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: khilman@baylibre.com, p.zabel@pengutronix.de, balbi@kernel.org, 
 jbrunet@baylibre.com, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_124402_707785_C2FB16D1 
X-CRM114-Status: UNSURE (   6.81  )
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

Hi Amjad,

On Sun, Dec 12, 2021 at 9:18 PM Amjad Ouled-Ameur
<aouledameur@baylibre.com> wrote:
>
> Use the existing dev_err_probe() helper instead of open-coding the same
> operation.
>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

For future patches: if you send another version of the patchset then
please keep any Reviewed-by/Acked-by/etc. for patches in the series
which have not changed.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
