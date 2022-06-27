Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F7CC43334
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Jun 2022 07:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GYIVSV56E52UGOk9vOh5U4dlPLe8oGtJfFetu0WuCHU=; b=2H6B2K9MdyHeQk
	61tq38Oai/EH0lO1Gr3Txoxea4fed6MwUaCfY0GRS8sjXwSq5Cz1+/FdiyRQlXODoCh8TzQV2NixI
	Ac2fh0dYeD8OEuM0uI5AIwqRG7CnifBcaCfzedhOH/ahn/zYD9eolxRyoM3k8MguMBNj8IGjiROG4
	NrS3LTc/4Sd6E9VzWCpr0uvvu0fp18IGBEM4DukQeMMe7GHHIsEsLQPbLc2AFhGGMviUf8DMqDaR9
	zXyQ3+XLS4f5ng5eAoksCTeyXd7MYlxAQSE+S95SqXBSet+1DJ3GHKfrjJciavmo4wq+BkgSAcjbZ
	qfOXDBtGsZydfPnvsqww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ikc-00GHSR-A5; Mon, 27 Jun 2022 07:01:38 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ik3-00GHEn-NV
	for linux-amlogic@lists.infradead.org; Mon, 27 Jun 2022 07:01:08 +0000
Received: by mail-wm1-x332.google.com with SMTP id m184so4771758wme.1
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Jun 2022 00:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=JQ6BJkIBB0iuDWSouR0v+Ao2Lgbe3w3R+14xG93o9xk=;
        b=2AWfMwMcTegs4b4opzBhY/wwU3S/mkbyFO3l+vsapib2LNgKheHE6IppogNvVtk5uP
         UlRY3k27QNO9mipLmBaqh6+12cRTCRxvUc6+Wfkb4aWceHfMVRKuv7amS0eNwSLJbAS2
         AUOLOpig137iD7NSOLfT0WBxA2FXBDx3Nrl7iqbRCXzBPXg8ZfDAOYAL7RwbymvSBTMq
         TS9+mAdBfsJBGrBIiR1+H00qKcc9vA+4HYRYvZcEHvj+0VW5JVi5k5p+N7Xxb1QZY8SI
         MhJ6OYcf0c6Zun9pri+O+LnyadlbsBSUez3Qjl176C2JQHVySFCOTJCb0faG6sLxIyct
         U90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=JQ6BJkIBB0iuDWSouR0v+Ao2Lgbe3w3R+14xG93o9xk=;
        b=R7GuF+C5HXHkBJiFIyXIGfC9iaQdGdwwo3f5JfWqMa5I/TNyp9jx4igYRLgrrTM+BZ
         Nf2/DEbiuv0vqBcd7Mkt2VWYbcPzIWEs/Dr+itX3qc4hSvrbD0+FNmPh1OApOS+p1ZPN
         RYYEJPZRr0EttO76n/j938NHbFdsLDWBfwVaKEMGQNqTf/inAwSVmFhsfatkES2NF7nR
         OdB/d5s05KAi40UmIeGmtaOsmXdJShQBrEo3XY9MvOJEx5m8dE7xCmAhvQMhn33pPJ2J
         JB90zVLHZmnW8N9auV4oe7JBQwPVnucOpQjmMhgn3UJ4/lu2bCqXAC1hywK1y0mtdH1+
         5Spw==
X-Gm-Message-State: AJIora8pY59FoBG9OWMTtGr9ZPav5+HIswl8vHrAd6xwQryl1RghWy94
	drZhjybnAsieYqHI7X3WWoa6ew==
X-Google-Smtp-Source: AGRyM1tsboWv7CmBuSib/MKQWOTP7R/cF8DQ1rA0QOY3EnXdzt4uRTN9+gNDfqLJF0pteDC8B0fi8g==
X-Received: by 2002:a05:600c:1d85:b0:3a0:3d28:bdd9 with SMTP id p5-20020a05600c1d8500b003a03d28bdd9mr13908668wms.114.1656313259081;
        Mon, 27 Jun 2022 00:00:59 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:6f56:f3c6:ba4f:bf5c? ([2001:861:44c0:66c0:6f56:f3c6:ba4f:bf5c])
        by smtp.gmail.com with ESMTPSA id r15-20020a05600c35cf00b003a0375c4f73sm11304434wmq.44.2022.06.27.00.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 00:00:58 -0700 (PDT)
Message-ID: <9cdf2ca0-4f86-09b0-8834-c0c39eb70054@baylibre.com>
Date: Mon, 27 Jun 2022 09:01:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 6/6] drm/meson: add support for MIPI-DSI transceiver
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>
References: <20220617072723.1742668-1-narmstrong@baylibre.com>
 <20220617072723.1742668-7-narmstrong@baylibre.com>
 <CAFBinCB=RJeaqVi+d6gGAsQTWAU68iFF6T9bXAQVYUWKxgiYaw@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <CAFBinCB=RJeaqVi+d6gGAsQTWAU68iFF6T9bXAQVYUWKxgiYaw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_000104_222186_2FF6F4DD 
X-CRM114-Status: GOOD (  13.28  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 27/06/2022 00:32, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Fri, Jun 17, 2022 at 9:27 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>> +/* [31:16] RW intr_stat/clr. Default 0.
>> + *             For each bit, read as this interrupt level status,
>> + *             write 1 to clear.
> Do you know if an interrupt line from GIC is routed to the MIPI-DSI
> transceiver? If so, we should make it mandatory in patch #1 of this
> series (dt-bindings patch), even though it's not in use by the driver
> at the moment.

Probably yes, let me check

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
