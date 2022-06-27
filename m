Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE07FC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Jun 2022 06:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDPTIFmAf7Q+LLCS13K+8psKA1QkfmSYnsFfATZocJc=; b=TFNlyyZyDX1gKQdQ1KWJO/QBC5
	uY2SsTqO/lXshtCz/d/0oEdgJTnx7/IF9l88IHYkanC2Kp1BioFf4oWAP52MnvM3X9IrAOXvpo1Rv
	o4hXoKiwwUIoWRbFPlOuZ3qLQZ9Ld+tyBycXKokD0y7lDMa3TODGCuW5UuIJc+dmRIK7I4QLd0dgJ
	EdL28wqFd7A8mM3NMQFlgjsdUznm8JBjJ2e9nvkZcFcuEORyfZeLBNLd6aHlRVHg6utvrxCwnvPKp
	JGVHGR0o73plYUWv85EkYQhZGxFXoBnXlboucl/Ef38j+cjZef11WLcN3ofeGRTlhagPEceCY9aNp
	AFrcYWFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5iX3-00GAfH-B5; Mon, 27 Jun 2022 06:47:37 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5iWb-00GAO8-79; Mon, 27 Jun 2022 06:47:12 +0000
Received: by mail-ej1-f49.google.com with SMTP id sb34so16941103ejc.11;
        Sun, 26 Jun 2022 23:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8HomK3l6jlBCLsSb7Jf/Zdvy1qIVhQIP50p0E/9QVR4=;
        b=s8BmlyPogAKBy2K3HVBFJOQ0g3hyt4Gw2stl8ypZUY20IMnFdVjpW5cYOOa44AQksJ
         MLXIvaYUmoYvZ/ahc24jtwBhwK/Ox3fmGa4TVcuZMLs5w4oQtWjFv3py2xaH9+1wSfbe
         x9LwefpNWnDvYmEhirE5HcHHYqAn5aY84lMFTgWo21i3QQm5d5mfAtFUaU4y3JBIrKYb
         xxBMcAJyJjVbIbCHpA3jcpPBsovuLGdCj0wYwtnZI7J9fMMhuoE8XZWgZtsSf0RusE/+
         BaVSFvraywo07V47Hw1HWwmCrkKm5/OggRSxMKtW92/y4ZKBH086Vx5+HAij1URf93vx
         A0Pw==
X-Gm-Message-State: AJIora+05cmqZFhcjENYSHu3UC4toI0+33X7PLqPTbIm29bJyyDbZgak
	IOhkUTK+uAcqp+vJWD4XUV4=
X-Google-Smtp-Source: AGRyM1u96qvLjAc8rMt3uBD3ubW9adxW2CDbwcX2yO+evsWDo+MMjNDM2rv0uVldDi1BuxZYwlq3mw==
X-Received: by 2002:a17:906:dc8a:b0:724:d541:d324 with SMTP id cs10-20020a170906dc8a00b00724d541d324mr11096133ejc.377.1656312426841;
        Sun, 26 Jun 2022 23:47:06 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id d10-20020a17090648ca00b0070b8a467c82sm4648674ejt.22.2022.06.26.23.47.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 23:47:06 -0700 (PDT)
Message-ID: <ede0760a-75e4-4d53-256c-86ca5a19a5f8@kernel.org>
Date: Mon, 27 Jun 2022 08:47:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 5/6] serial: Convert SERIAL_XMIT_SIZE to UART_XMIT_SIZE
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-serial@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org
References: <20220624205424.12686-1-ilpo.jarvinen@linux.intel.com>
 <20220624205424.12686-6-ilpo.jarvinen@linux.intel.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20220624205424.12686-6-ilpo.jarvinen@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_234709_313256_1AC1723D 
X-CRM114-Status: UNSURE (   5.43  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjQuIDA2LiAyMiwgMjI6NTQsIElscG8gSsOkcnZpbmVuIHdyb3RlOgo+IEJvdGggVUFSVF9Y
TUlUX1NJWkUgYW5kIFNFUklBTF9YTUlUX1NJWkUgYXJlIGRlZmluZWQuIE1ha2UgdGhlbSBhbGwK
PiBVQVJUX1hNSVRfU0laRS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBJbHBvIErDpHJ2aW5lbiA8aWxw
by5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+CgpSZXZpZXdlZC1ieTogSmlyaSBTbGFieSA8amly
aXNsYWJ5QGtlcm5lbC5vcmc+CgotLSAKanMKc3VzZSBsYWJzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
