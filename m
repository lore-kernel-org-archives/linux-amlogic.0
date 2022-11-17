Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852D7C4332F
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Nov 2022 13:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LzXm0oleaJN4cQdG0r0XlDYsGBhdizbxRSqbqj6t1lA=; b=S0yZKBmA6rKn+Cx0NNKex4JT5J
	dKZHdvQ+LXl6QN7RhPiRP9XLMFg4tJ+2weVdRYtXfDswpFlwPfiMAFEROmddCzcQS3TQZp1HTcGr0
	v7Tfhlc83K12OZC+IdQyJn1VAKYFFcnlQ2jkQBc4ZN3U5ZiwVUS2Qj0Qi/3UEJyUPwpnJwmxYof1N
	pEhS9nNB2EN/70fvGmwJblNIUBvM1yq9sCC2AFp/Ev1RniFJJTCU6Zz5HnzQopcOhF7rpBBVwBgv6
	JZybAj5JPWE9I5h4o+BhLon3TxWqcorDlp44waP2krlFXcKsURKNTuzoUtdaiven/pLXoEumRgZjv
	kV47qYZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovf8A-00ETfm-Rb; Thu, 17 Nov 2022 13:40:39 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovf7k-00ETCy-EV; Thu, 17 Nov 2022 13:40:17 +0000
Received: by mail-ej1-x630.google.com with SMTP id m22so5049215eji.10;
        Thu, 17 Nov 2022 05:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=dOA/XrnM55biePtmSgVQuz/vvaK7Pp/nrxDlHicjXLw=;
        b=b55P44Wa551fN/B8v9btv1bZewuklhAEgqDACB3G4DxO/3tSA+sMxdYw79PP7i80z5
         /sVk8z6Z/ARHsSepF2anN36AOd8gexjbGfhK26rciQbxdkKhb9vn8KyzriTRPVB2kMEM
         BHxe73XSue/R/bzTj2piXsRdJ5SgLqwV+E9Pwc/C5gHFgqdc1qJYwmqN7865ePorvG4M
         RDTmId2tnAr4IBFbw3VlRu9cYDr1GiOL16dxTuDfxgz2dLoLoThE0kNwsv+kdenLKzsY
         EH7hxIxJOu4fvN045NCztwjhhpGrImBWX5L/cRK2m6N45tm3ZYG/rqVRO252aDUQcpyQ
         gzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dOA/XrnM55biePtmSgVQuz/vvaK7Pp/nrxDlHicjXLw=;
        b=Zp5z8RWt1MNbr1B29+6U3Pb1QUQ69si4gb47t/pukSh9VtWzQ+Bj5EyaxUDp/VmTYi
         zuKDx2tZPXW2Q79IMegRnrpj79lt83/jTUPvCnltCT4p/U+reFmZTO8eua/NpZKtQvnj
         i1wN/Sxc0DwE08oGA44KSTwtsDAOzRxRJn6EAJ40vq3LNOsUb2GWnpU1/u1u884mtoM3
         u5kiKaDbyN3vjOYXK3ytyGNzHtOYlWDTI5eGl27rhbjyPoP2G+DRiUz3ejskD4onZymC
         DMhJTqaLqi2yYC6EA5bjOL5quEVMJnzWYGYUxccZJzaJagcT9h5qyPYCBLLJv4m0eE8g
         6RXw==
X-Gm-Message-State: ANoB5pllXPT4XiiSEZRhNlrslhT+wZoPZZRE5EPhXY3Y6vvRYvvLvycZ
	bFaK3gekRDdY4NMiYyy04NQ=
X-Google-Smtp-Source: AA0mqf6BksfbC9nZboB5WTuEjWop9CJaYyFiqnM/7Bx6amuVd+tme9UjR6NShhiXVh2I+/3cyukngA==
X-Received: by 2002:a17:907:767a:b0:7ad:e518:13fd with SMTP id kk26-20020a170907767a00b007ade51813fdmr2155160ejc.323.1668692407595;
        Thu, 17 Nov 2022 05:40:07 -0800 (PST)
Received: from ?IPV6:2a0e:41a:894f:0:7a60:27eb:954c:5ab1? ([2a0e:41a:894f:0:7a60:27eb:954c:5ab1])
        by smtp.gmail.com with ESMTPSA id bw10-20020a170906c1ca00b0078dce9984afsm373454ejb.220.2022.11.17.05.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 05:40:06 -0800 (PST)
From: Carlo Caione <carlo@caione.org>
X-Google-Original-From: Carlo Caione <ccaione@baylibre.com>
Message-ID: <cd2d4d1e-f42a-da5b-e498-fbb32f792094@baylibre.com>
Date: Thu, 17 Nov 2022 14:40:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/3] drm/tiny: ili9486: Do not assume 8-bit only SPI
 controllers
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, David Airlie <airlied@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com>
 <20221116-s905x_spi_ili9486-v1-2-630401cb62d5@baylibre.com>
 <Y3YWdeTLfmDh7UyB@sirena.org.uk>
In-Reply-To: <Y3YWdeTLfmDh7UyB@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_054012_586093_2A5660C5 
X-CRM114-Status: GOOD (  22.76  )
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

On 17/11/2022 12:09, Mark Brown wrote:

> I don't understand what the commit log is saying here.  The 
> meson-spicc driver advertises support for 8 bit words, if the driver 
> is sending data formatted as a byte stream everything should be fine.
> It may be that there is some optimisation available from taking 
> advantage of the hardware's ability to handle larger word sizes but 
> there should be no data corruption issue.


There is no data corruption but the 16-bit pixel data have per-pixel
bytes swapped: for example 0x55AD is sent instead of 0xAD55 and this is
causing the wrong color to be displayed on the panel.

The problem is that the current code is sending data with an hardcoded
bpw == 8 whether the data is swapped or not before the sending.

For 8-bit only controllers the data is swapped by the MIPI DBI code but
this is not true for controllers supporting 16-bit as well, but in both
cases we are sending the data out the same way with an 8 bpw.

So the same image is basically displayed differently whether the SPI
controller supports 16 bpw or not. I'm trying to fix this by sending
data with 16-bit bpw when the controller is supporting that.

Please note that this is what it is done also by mipi_dbi_typec3_command().


>> +	/* +	 * Check whether pixel data bytes needs to be swapped or not
>> +	 */ +	if (*cmd == MIPI_DCS_WRITE_MEMORY_START && 
>> !mipi->swap_bytes) +		bpw = 16; +
> 
> You should check the SPI controller compatibility here.

This is already done in mipi_dbi_spi_init() by using spi_is_bpw_supported().

Cheers,

--
Carlo Caione

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
