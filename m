Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309ABC0015E
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Jul 2023 20:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZbcH28v4+NG8mUWl5Ju2h/HTWZ7JnT0UGwhvXufyK6s=; b=qVdA6bFTAgHd8M
	A9OlnOeq4YumwL+c4TiKH6804uX6YyPT9p1Y3t4sy1vYgEmPPO3I8IqFfRCh178x/Y028femOtaYH
	SrUosUqZOpY4nhIZpXstHcHUra+WJCXGgKvSaRT3hoLkpaeScYaRnU+4SPjtRDXys2rTF6piLR3Iq
	PoV1y5cW0GothEIwJSxzw2R840LEyOZ05mbCVIfplc14bgBdukm8YKF45U+0nWUJK31k2kCYTuu0P
	vh/0umB5ZKMp2ij4BLW37pagE4MPECpr33dTlXhj8vyGburAspTTm4C4l39iGLYczFxDoM4mLsC67
	zxqB/nb6bsGEJYdzLOFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL8II-00F3NR-1W;
	Sun, 16 Jul 2023 20:24:38 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL8IC-00F3HJ-3A;
	Sun, 16 Jul 2023 20:24:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1689539050; x=1690143850; i=markus.elfring@web.de;
 bh=SXHfcx/AmWvMIs9QwT5FzKuxKIWGSKqTNtRaMzmQrJw=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=qVKp51lzlOclKYja5cwwLnpbcQlcxxc5Au5kirgBJOipBVJbkj12HYvNFp84osWdZcdbYpB
 6xipGx0wRYailTWptZnsVuBG6UePqszRpCbqW5Zv65n4hybDr5b9U5g22gNkRTobltAr/2lLG
 xx7A5fTeogmYy54/fZMur6I0qqdzUukN+og3dLjOrrIpGMDNlARKX3quiF+io30PJQNnGvr01
 baoRcfMu/gfEDjoeQ/hQwCXMU2zxnKzKSRRD7YYioEBDzFjd2GMjKy2jYl04u/mqnY4ryhGgP
 vCj9qyo/UXLKM9iRlkw9qQaFc6rIKShLbbeIn3eRo5jkwA7kZvFQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MKM5t-1qebLR34QB-00Ly2W; Sun, 16
 Jul 2023 22:24:10 +0200
Message-ID: <eeb9465a-da71-c182-22df-77f0e5ed0c39@web.de>
Date: Sun, 16 Jul 2023 22:24:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: George Stark <gnstark@sberdevices.ru>, linux-iio@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jonathan Cameron <jic23@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, =?UTF-8?Q?Nuno_S=c3=a1?=
 <nuno.sa@analog.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel@sberdevices.ru
References: <20230715110654.6035-2-gnstark@sberdevices.ru>
Subject: Re: [PATCH 1/3] iio: adc: meson: init channels 0,1 input muxes
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230715110654.6035-2-gnstark@sberdevices.ru>
X-Provags-ID: V03:K1:VT0nClUsrJ3zQ5hgmu1KONEEdP67cUtt0sDfzTzR/EuGa9o+FCP
 gfK+xnqG/FAb+nrNgnxT6NyjyE4N9VGYzrlxUVwmyTAjxh9jHLwTzl2AMicbLAmqT46U7qp
 +FVvgx6cmE+dqJlvJ1sCt6gw96h6sbJ1VVLJuFD4N9zdn8PYvBrElpmzngDpvX/iQjwBmGK
 DOlXtDmdCL43wyFfdOdXA==
UI-OutboundReport: notjunk:1;M01:P0:pS/bHZULfcQ=;lQCm/I04gfi1430FBUQpC/ccENJ
 QWUmkvnMqVG9wUnPe36y+dTLyKMzgndEF+KvK5vZAGM5i+qBau0AZDdFJIhxCQRqDklWdON0s
 GIXFWB7XJjeQKolpxNJSKCK7LL3trDRMDOL5pCb6ajIuY1jLDpHmq+UAlruktQJkKnT+oXxzJ
 uwX3/HMe2vwx961c9j/3M/4j13MPnd/rm1jPP8u3U76N7MkwMHy6iVFBFHToD6vilGkzV9a/A
 +9cLnVpr2Pkhk64Es2nhYV2Nt2jWXk2Loja/BS1pCsTfI9aNbhjKJO8ua8nJfmu0+ZAYEZDHw
 HYjkhyr1+PsFWOzorkiXWwtECayJ8SbiHpPu7HflrFqgQF1FDJZ5XFMlxYDUxZ1WVgTsN1mYs
 e7f6NNoT87tk0Cpypf929zLDIDvxSyUjYKAFi4am/pLFUFNLC6S4s8VQWVqt83CK8i/tJjNtS
 US/LhhOUnV8WrKWqTXH5Z9VXsKpkBtWilo9xlfzCsZ4+Ja/cnzoBZtu/D9cNGHmLEn5s3vVD6
 RSPIdEMFsUqWb2gSqYN+ri4mjbxUWnSPJ8zRe7wsbIwhO77kn9C+Z0YumYlrv9K0cdKfZlQJO
 eN/58BPSDERV6TQM76AmuqnuxHmUMWHNU0YKnxn3ZWAQ9koREAE6b6p6n2Zesu+rkqLp5iS39
 owIov8oxiPf2rICaVeNCYHIh7cDBDhaoVshSvievGmSPjThA3TOtA6EgwaSAX3VKAdoC3hnXY
 z+L7R3CZKG/Jf6JEd45/3m4BIMhaO7KI4O/hO7nEdKQzuKlvtgBnUfDorNvSjlgmTze/Dlw+s
 7NcuIsTnOj8D9krXWrXAb/Kd6B04FSjq8axuQJqG0zX7smojjxMZEhS7mt6LX+3aOkko15D3c
 XmM8Jdt+EblRPsds8Rl3Q4Vu5RyRikWgHmP73YrWimD8uC3bLaKj8SoViS6hrXBy+YtzW59ai
 jsv+vg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_132433_493709_91B8986A 
X-CRM114-Status: UNSURE (   5.99  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

PiBTZXQgdXAgaW5wdXQgY2hhbm5lbHMgMCwxIG11eGVzIGluIHRoZSBzYW1lIHdheSBhcyBmb3Ig
dGhlIGNoYW5uZWxzIDItNwo+IGxhdGVyIGluIHRoZSBjb2RlLgoKQ2FuIGEgd29yZGluZyB2YXJp
YW50IGxpa2Ug4oCcU2V0IGlucHV0IGNoYW5uZWxzIOKAnDAsMSBtdXhlc+KAnSB1cCDigKbigJ0K
YmUgYSBiaXQgbmljZXI/CihJcyB0aGVyZSBhIG5lZWQgdG8gYWRqdXN0IGFueSBjb21tZW50cyBp
biB0aGUgc291cmNlIGNvZGUgYWNjb3JkaW5nbHk/KQoKCldvdWxkIHlvdSBsaWtlIHRvIGF2b2lk
IGVtcHR5IGRlc2NyaXB0aW9ucyBhY2NvcmRpbmcgdG8gYWRkcmVzc2VzCmluIGFwcGxpZWQgcmVj
aXBpZW50IGxpc3RzPwoKUmVnYXJkcywKTWFya3VzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
