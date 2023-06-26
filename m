Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E2CEB64D7
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jun 2023 13:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVvUmVMhD3oOhHc6BABCn/Rvp5AcmL2w4OPAw5OuBTk=; b=ssA3TmI+L2kexzq7qWdyQKel48
	S6L8MCCPMIxS71MNGVW6R3RciPRhBxqESb57UNlTanHzBLFmDF8zbrvtc774MQ8Wi7JB3UiVdut7s
	IRDGQiQNcl6cHKdTKU6BXzIBw4uw5o5+D+yK2rTn8F8glrdVqTL/Ms9jYlej7V81TWJf8QKMqy5p7
	+S7YlIhhVKm4jRsBytxL/AjcK67b9ahY+GLWXjQDAKBSrJRrdlzdfl9PVOcKlPLB1YoPUc6huFc++
	4Un5QJK66SRw/cjju1waL2STlpikEFMy1cEXGDjPoQeQ/qoRQ5JS6/8baE8A+BP4F0OMxadDkC8Wm
	scF3oAvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDmON-00AJIF-2b;
	Mon, 26 Jun 2023 13:36:31 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDmOK-00AJGl-2l
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Jun 2023 13:36:30 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fa99b57a38so7316905e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 26 Jun 2023 06:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687786586; x=1690378586;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zdAAUjMq1y7wfLWcQNAaxgJmEQr9gQBVn17s0TNFY3s=;
        b=MJvJ+BDDMP5m14GpFy+9WfqZ2oABvFrcpJ3CqyRiZ2jg8XirfxfqsNMA77Y8qdTPpU
         q8So4CfTI5n9kWDxNzU8aaQbpnWvv9Tw7lq0OFa5TuiCTZQl79AppxFtJVA5Kb4pnQVD
         bRXsCzOnXd5ll2dcGFcEwknyDF9bKLWLSy1RwMXzXY0VlVTxsXdupVDy2qcCCdbZIVYN
         qHV/AjkW2uB+/1ngrvSgOqRegouuR0rMxb9OS+Koav95WQVaAbFWqZGEZmNi5l+wGsmu
         Bh+chTDMuL/revbimYTm6krQxnbDYYlMjJ2Gw6sjmzJtOETnBLDNzs7QHsiIFugTegVE
         MDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687786586; x=1690378586;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zdAAUjMq1y7wfLWcQNAaxgJmEQr9gQBVn17s0TNFY3s=;
        b=H21HG6oIr3i0gyreU9ocyC+GQ9NCUV9yf3xwwMejrQtBW3DLUZupByCzL5u1rVJ7N+
         uQ1Z8XEY+gygh6YwKYY+ESpZeqEc3s3uV5tvvKQNt+JHEr75fF0ngpf0mWqxMmSINsJ0
         6Q8xvRWCZbAjIDxp0njgJN+wmWUFG5Iu5M2QX3aMmJmlh2EDR6ql3dJaMTGpnT+Qtf53
         1AWSX++rcydFDeOhwNYyXuhdvjFvqtxHB3v4yirWvQ+U1J9rTvFsczBhGhBGQyrU1U+8
         wUlwjlfCCpl4AC6nnTS+GDmZM72/EGx/mTxOV3AbOMd4gon+lMNslcZkI1fK4F6MD0BQ
         D6Sg==
X-Gm-Message-State: AC+VfDzR3GQi4tkfwVwCxoob82yJ1LCviJ7mSbdyY/sIXWjBrAS7LSpB
	FeV9GhUYJSMdN3uo0oJjf+mkpzRTNaiHnPza/TjHMw==
X-Google-Smtp-Source: ACHHUZ4KDlrxPN0DkcnPjN3hKw3cGBfyGCmIkYwPJYPv7vqp0WhYABootPEQ9XYW8moz8aTWe9XAaw==
X-Received: by 2002:a05:600c:2119:b0:3fb:407e:9b31 with SMTP id u25-20020a05600c211900b003fb407e9b31mr687651wml.37.1687786585412;
        Mon, 26 Jun 2023 06:36:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b25a:b26e:71f3:870c? ([2a01:e0a:982:cbb0:b25a:b26e:71f3:870c])
        by smtp.gmail.com with ESMTPSA id f23-20020a1c6a17000000b003eddc6aa5fasm10574507wmc.39.2023.06.26.06.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 06:36:25 -0700 (PDT)
Message-ID: <41e6d93a-8899-e792-0859-d26360ef5dab@linaro.org>
Date: Mon, 26 Jun 2023 15:36:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 6/6] arm64: dts: meson: a1: add eMMC controller and its
 pins
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: jbrunet@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 conor+dt@kernel.org, kernel@sberdevices.ru, sdfw_system_team@sberdevices.ru,
 rockosov@gmail.com, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jan Dakinevich <yvdakinevich@sberdevices.ru>
References: <20230607201641.20982-1-ddrokosov@sberdevices.ru>
 <20230607201641.20982-7-ddrokosov@sberdevices.ru>
 <CAFBinCC_g6FhzR=PNDsYwT4OZb4uAXAWYGKSe7vSX7_pWM8pNA@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAFBinCC_g6FhzR=PNDsYwT4OZb4uAXAWYGKSe7vSX7_pWM8pNA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_063628_895744_A9A1631F 
X-CRM114-Status: GOOD (  13.52  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAyNS8wNi8yMDIzIDIzOjExLCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdyb3RlOgo+IE9u
IFdlZCwgSnVuIDcsIDIwMjMgYXQgMTA6MTbigK9QTSBEbWl0cnkgUm9rb3NvdiA8ZGRyb2tvc292
QHNiZXJkZXZpY2VzLnJ1PiB3cm90ZToKPj4KPj4gRnJvbTogSmFuIERha2luZXZpY2ggPHl2ZGFr
aW5ldmljaEBzYmVyZGV2aWNlcy5ydT4KPj4KPj4gVGhlIGRlZmluaXRpb24gaXMgaW5zcGlyZWQg
YnkgYSBzaW1pbGFyIG9uZSBmb3IgQVhHIFNvQyBmYW1pbHkuCj4+ICdzZGlvX3BpbnMnIGFuZCAn
c2Rpb19jbGtfZ2F0ZV9waW5zJyBwaW5jdHJscyBhcmUgc3VwcG9zZWQgdG8gYmUgdXNlZCBhcwo+
PiAiZGVmYXVsdCIgYW5kICJjbGstZ2F0ZSIgaW4gYm9hcmQtc3BlY2lmaWMgZGV2aWNlIHRyZWVz
Lgo+IExldCdzIHdhaXQgZm9yIE5laWwncyByZXNwb25zZSBvbiB0aGUgb3RoZXIgcGF0Y2ggZm9y
IHRoZSBxdWVzdGlvbgo+IGFib3V0IHBpbiBtdXggc2V0dGluZ3MKPiAKPj4gJ21lc29uLWd4JyBk
cml2ZXIgZHVyaW5nIGluaXRpYWxpemF0aW9uIHNldHMgY2xvY2sgdG8gc2FmZSBsb3ctZnJlcXVl
bmN5Cj4+IHZhbHVlICg0MDBrSHopLiBIb3dldmVyLCBib3RoIHNvdXJjZSBjbG9ja3MgKCJjbGtp
bjAiIGFuZCAiY2xraW4xIikgYXJlCj4+IGhpZ2gtZnJlcXVlbmN5IGJ5IGRlZmF1bHQsIGFuZCB1
c2luZyBvZiBlTU1DJ3MgaW50ZXJuYWwgZGl2aWRlciBpcyBub3QKPj4gZW5vdWdoIHRvIGFjaGll
dmUgc28gbG93IHZhbHVlcy4gVG8gcHJvdmlkZSBsb3ctZnJlcXVlbmN5IHNvdXJjZSwKPj4gcmVw
YXJlbnQgInNkX2VtbWNfc2VsMiIgY2xvY2sgdXNpbmcgJ2Fzc2lnbmVkLWNsb2NrcycgcHJvcGVy
dHkuCj4gRXZlbiBpZiB0aGUgcGluY3RybCBwYXJ0IHNob3VsZCBiZSBwb3N0cG9uZWQgdGhlbiBJ
IHRoaW5rIGl0J3Mgd29ydGgKPiBhZGRpbmcgJnNkX2VtbWMKClllYWggaXQncyB3ZWlyZCB0byBh
ZGQgSFcgZGVmaW5pdGlvbiBhbmQgdG8gbm90IGVuYWJsZSB0aGVtLApzbyBwbGVhc2UgZW5hYmxl
IHRoZW0gaW4gdGhlIGJvYXJkIGlmIHlvdSBhZGQgdGhlbSBpbiB0aGUgRFRTSS4KCk5laWwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
