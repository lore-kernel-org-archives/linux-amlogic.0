Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A76C4332F
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jan 2022 07:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Osdj1kBMMMWJ08fJeXYhS61bKxiUjCd/YQfr5Jm+ybg=; b=BD5PDacO9umaKh
	fWjzfarnu0ubb5g03nLKhhrC7YTuQ164+5Spb/G3AFycPkMCrluxca8bTND/qKuHy+vzWSr1bb+IZ
	E3xWYbnGo9pIkMofCbebWukMoSTPSSzcu0xg4qsBWZAA5m2xQXyUCsxgRL8oGfqBftxQI4BDsIbEi
	qwm7zVPMc23rrVX4XNevwthjGjJhR2hlyDdyXUIq+vJrTIgoLqqEt2K5E5WWmtiyF/WHvzyXjNpra
	lojzHIBWwroaGktBLjH2rEcSUWhKe5xiEGhmBu4d68mwhqUgOQxFCV9EEyZzIO4AcGvnkWGpHaO21
	K02Hxolca8spo7pYr4BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7uUm-004yrZ-BX; Thu, 13 Jan 2022 07:26:04 +0000
Received: from mail-ed1-f47.google.com ([209.85.208.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7uUa-004ypu-Gy; Thu, 13 Jan 2022 07:25:53 +0000
Received: by mail-ed1-f47.google.com with SMTP id q25so19742936edb.2;
 Wed, 12 Jan 2022 23:25:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=str16FI/F5xFD0n2C9n5hc+OZX67vqcPfd5sJFbgdGI=;
 b=R9F6GPrNznfD/MBg/1cUwON29ydM2l7bsAoNtEGbK6AmBO3xGaGEZp+V9+1CjBVtiX
 g3zFGI3lBagTwaWtxqKCEJJL3F6bu6/zAQLvArDWmpGfj5KvthlkhBoKOaKeteu+bbBC
 +ruVFPcq2UKdFELCrgMzMC4gmSagBSNYTWrXoTEppwynDyErNWYaujdUMzFW8ZeNfNVk
 elt7poajcDRa1y/bQJbKO+Nl9R1o5Xk8MQtucDcUM7OOcc5VRRB96sjfZoTAKwbCYvAB
 nGJZKNEnF9GOoLF+k7FBdz92PswALTELdtPJlZA55PDhAke/o+j4h3/xBaetpeW1smxS
 G6Dg==
X-Gm-Message-State: AOAM533ovdrwIWifqLCt4jhD9sF7Kk3FVMYIu4HRzzjuHbiokeUhqh/C
 VwxsWtCuu1p6woB5Hbs2cFo=
X-Google-Smtp-Source: ABdhPJxKV6lDv8a8uMbMek/SWb8lQRWHNN5x+2X9xP0AmxTdpAmdqC2KIsyXwzOuWYYYr1gfrpB/MQ==
X-Received: by 2002:aa7:dbc2:: with SMTP id v2mr3053045edt.59.1642058750696;
 Wed, 12 Jan 2022 23:25:50 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id g2sm587549ejt.43.2022.01.12.23.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 23:25:50 -0800 (PST)
Message-ID: <efce614d-c8e6-bb06-e3c1-cb67b26bbc6a@kernel.org>
Date: Thu, 13 Jan 2022 08:25:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V5 2/5] tty: serial: meson: Move request the register
 region.
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220110104214.25321-1-yu.tu@amlogic.com>
 <20220110104214.25321-3-yu.tu@amlogic.com>
 <01066e66-5d97-ab40-b4a6-99e962b47073@kernel.org>
 <cad33ab0-26d3-5b78-3bcf-62217aa70871@amlogic.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <cad33ab0-26d3-5b78-3bcf-62217aa70871@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_232552_601409_1F81E457 
X-CRM114-Status: UNSURE (   9.03  )
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

On 11. 01. 22, 3:48, Yu Tu wrote:
>> And no, do not resend a new version in the next few days. Having v5 in 
>> 20 days is a bit too much. Give maintainers and reviewers some more 
>> space to express themselves.
> I am so sorry if PATCH is sent too frequently, which has disturbed you.
> How often should I send it? Or under what circumstances can I send the 
> next version?

~ one week after the last reply to your previous patchset is about fine. 
You could see that people were still responding to v4 while v5 was 
already on the list.

thanks,
-- 
js

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
