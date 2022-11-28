Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B17C4332F
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Nov 2022 08:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UBd+sgQEjSNFCVhlkf/IPck6Q6npmGmaMUB4waUtug=; b=H8CC8iLXl+xhcgcfOK+3dP+sN4
	7s4IaMBA1jwV6dqqXb6u648SzWTK6B9GmNo3R633C4ASqH+4W5hPitdVFRhYOR2EFVNLd0e7Dq5pu
	U9lYxdmzNUbKRDyHmeBf4FxRuIUd9QFR7A81gz2NmjUvQ44mErgvLcnmP3hQ7tRtFMV0xJH9Si5O/
	MHY6+k8jmA3z5S0Iu/pJghCqMAZbe6WZ1qCcfIKU6rZ0xaSkjaWAzAM/JbHjfiUzJ1BI4JghSe7qM
	iwrXSB2hmvxfeM8k7CJlxSAdZaDm4brn45az8kK7nQgdSgtUCvp/ocj0RUJjL3fmsNHWoUs4qzYsj
	pfPGMWew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozZWi-000EfT-Cs; Mon, 28 Nov 2022 08:30:08 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozZWP-000EPY-Hq; Mon, 28 Nov 2022 08:29:50 +0000
Received: by mail-wr1-x42c.google.com with SMTP id x17so15511034wrn.6;
        Mon, 28 Nov 2022 00:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IOpIkVTZ1HCSepxMCiPIVLc3Du6eeySPU1lvrDaAkA0=;
        b=iP2YYiwl9QvU5Fj9JzDa1Ner+PSjuXkcCMEmS9tW23BnczYppbVvnJU9HQsJRJDFNS
         HZGopcus13C3caspnBXrNSgkN7Ofp4VoMRbERqTmkFgkdmRtkTLT6WoY7RMoq/jRUGCv
         vLXOswkWlJEKu1Hyy0pOgM4fW9NcyhRx/KCsxN9lehS7MgaxFxnjENjvvO1kv/WI2S9d
         k+q36KaGkqU7wTycEHYnKklfdJNfqs5rXFwBvKF9R2aa+qcM7CxT+KZAjTHmr/sD9S25
         tE6J9yWHEhkDhFeHXd5X3qJCiBLzVZW2PI/+Ma07Rz8x6BR/OgIeJ1Hp4kPTGRy0NY0p
         0bJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOpIkVTZ1HCSepxMCiPIVLc3Du6eeySPU1lvrDaAkA0=;
        b=6gaAVpNE1TNarVGaf7atPOUoaSyNjR9OcUZnC6Qy9H+S6RE/xGfSecgS4EvR7eKDMM
         35DMAuFKUHp5a2cI7a/erSucMvLOh1cMTO/maUi0/CgoPw7ib6PkWINTNOhtd/GGcz3s
         gb2qxkYCPtIR6EbWnr2CkH3pLSd9M9Xkz1nFY2Y3pcCjGtteXeqOTqqR5IFdJi4YxoOS
         CjGjvDIp03ieX4gc5EYR9uNMHTCVrHprSf7baOMOA3npkAfdzlmrYQceM/euRVz0eRVl
         p81Eq3K0Dd1ATMNBx8kkXdBd5nMJZLalRtfshJjaUBWzy05SmFYiNGKNWtoaqWKViWEH
         RRHg==
X-Gm-Message-State: ANoB5pmQ7SJHCwi6cx9X9eIpeT89zdWx6jk3U0Y1lF9+j4M+SrRAwllH
	Vpwv00VRYZfZk72k3eyA/tU=
X-Google-Smtp-Source: AA0mqf5o3omyFNxLGgAAlS7h9m5pGaApcXCeWfag+9dMe/kyf/xcUF+n/HOzhL9shN+Mov9HNNGpdg==
X-Received: by 2002:adf:d0c2:0:b0:242:a37:7abf with SMTP id z2-20020adfd0c2000000b002420a377abfmr7101743wrh.190.1669624182677;
        Mon, 28 Nov 2022 00:29:42 -0800 (PST)
Received: from ?IPV6:2a0e:41a:894f:0:78ad:176c:d7ef:5797? ([2a0e:41a:894f:0:78ad:176c:d7ef:5797])
        by smtp.gmail.com with ESMTPSA id i17-20020adfe491000000b0022da3977ec5sm10020436wrm.113.2022.11.28.00.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 00:29:42 -0800 (PST)
From: Carlo Caione <carlo@caione.org>
X-Google-Original-From: Carlo Caione <ccaione@baylibre.com>
Message-ID: <a896ab20-6a08-fc41-ff2b-250ef477d801@baylibre.com>
Date: Mon, 28 Nov 2022 09:29:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 0/2] Make ILI9486 driver working with 16-bits SPI
 controllers
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221116-s905x_spi_ili9486-v2-0-084c6e3cd930@baylibre.com>
In-Reply-To: <20221116-s905x_spi_ili9486-v2-0-084c6e3cd930@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_002949_625072_197889D3 
X-CRM114-Status: UNSURE (   7.63  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 21/11/2022 10:42, Carlo Caione wrote:
> This patchset is trying to fix problems seen on S905X boards when interfacing
> with an ILI9486 equipped SPI panel.

Gentle ping on this 2-patch set.

Cheers,

--
Carlo Caione


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
