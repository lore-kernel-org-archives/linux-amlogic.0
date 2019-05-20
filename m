Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5992BC04AAF
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 18:34:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32422214DA
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 18:34:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p/X3Gin4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DBxlmCZE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32422214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tkZZYYM1kYli9BHE+mQYjkoonR95W67GBf4if67pn04=; b=p/X3Gin41N/OPt
	oH0QGOglfI9hxmhY5n4rvHWBecw5yT8C+pYIGNdGFtfYPj87172BNyCH8ZxdLQkgmhD1Prwk5Y980
	g/CELWWO9P/llDHv5yEKfMN5eqkkn0B7kl9PuSnemVqIrM1/Fj6PcT4iFhWFAp2FzqgXnPDl/0cN9
	kaCTbdKfWabeHtzOP5w97QIdbNdswOM7F22Zy4eNz6CDmgDMvG66UKhfmc7t1xLy9ldZXXg25mpK4
	gWPznVSy2KPBnZQyHW+GwkHdTBq2DjjwUNg4tg8DGBlWLxMcDVnn0Z0uyniGjMzZPQCYXWoqRddgA
	lP6uWDSmQ/ztKoHx7W4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSn7T-0001py-St; Mon, 20 May 2019 18:34:43 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSn7L-0001io-5k
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 18:34:37 +0000
Received: by mail-wr1-x444.google.com with SMTP id s17so15749786wru.3
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 11:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:user-agent:mime-version:to:cc:subject
 :references:in-reply-to:content-transfer-encoding;
 bh=wCpNgUaSRqQ+NRb8eHf40n9iQjypeZPQ4KDEREuAn30=;
 b=DBxlmCZEUqtTCDkrut51v8cijQmVeobqeWrZn7uMddx1ZvlZOOYvagsiLBgOp3+rus
 S4i1vhieKERLcAviEsFOI0OkAbSMYlVEv+z1Jj7GV1PBG9L6XjQV44pdVhnMkkF2HpH5
 8oWLWsXKoOxuLD+POD8brFU5TbH3/c65p7V3DtnIQp2vE/obNG1rj9z5+9Nm6kOy6sSJ
 7H+ibnJql0Ywk/3jjSmrobfZ6TMD6sf0yposEXQfjZpzEU66Ufx+QaQYp9enLyLADJ5S
 g5NEjtzbkYkoQDr3T8t6+yHo183LNES/9DeeGmRGuU1lBSmsv+g9xgEcz3qovO1QaLQv
 XRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
 :cc:subject:references:in-reply-to:content-transfer-encoding;
 bh=wCpNgUaSRqQ+NRb8eHf40n9iQjypeZPQ4KDEREuAn30=;
 b=Y8zX5V1Ib9SQRunsDjxhgCuN/tNaJ2LLBluBBis2+4u23NfR1bnDb2Y+A9i+hB1OuZ
 7dx2I9ZDyuU6wMMZ7knJlNYpCWwWzJry/wJnCYSqQilUDPrksTQ34L6C2JGZoTGEs+qP
 E+ilbRojp4D7A7yC3RuOOGPVX8wek+SeIiQO7IQ2vNZ8vsec/msN8j1NbVg9vZjtRB1r
 pGzcgSSSLV4raq9eti4FAgBbvJc3l3kWnPgbDMVrRZs4pgPiXyTfPxXd8NEr5bUU5vsi
 1KYxi+WRUCeU1w0LPz9ELiCuMHdVUXqmFOcE1rFFnyYE5viFbtpS+Sb9jobZkFSVUxLT
 CWsg==
X-Gm-Message-State: APjAAAWczbkonJFSPp/JATgyW6bwiAfwlXnqXg1Loz1ptOHnZs8MZz3V
 xD/6BwFp1rTqy/vnJ3U/Wu5wUw==
X-Google-Smtp-Source: APXvYqyVIBqjTKvFY23aNyMKIltNloLDsuWfNj5r52gjwtDfVYWPC7Y4McdoKdcDIaa8uMytlfuXAA==
X-Received: by 2002:a5d:68c7:: with SMTP id p7mr24241576wrw.23.1558377272966; 
 Mon, 20 May 2019 11:34:32 -0700 (PDT)
Received: from [192.168.1.77] (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id v5sm37487367wra.83.2019.05.20.11.34.31
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 11:34:32 -0700 (PDT)
Message-ID: <5CE2F337.9060207@baylibre.com>
Date: Mon, 20 May 2019 20:34:31 +0200
From: Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13;
 rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 00/10] ARM: meson: update with SPDX Licence identifier
References: <20190520143812.2801-1-narmstrong@baylibre.com>
 <CAFBinCCEi8OjeDaWxfhyfoQOu3GVsw=U9jBLQ2LEkPn7Ataf7w@mail.gmail.com>
In-Reply-To: <CAFBinCCEi8OjeDaWxfhyfoQOu3GVsw=U9jBLQ2LEkPn7Ataf7w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_113435_550781_F27C5B7A 
X-CRM114-Status: GOOD (  10.69  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpMZSAyMC8wNS8yMDE5IDIwOjA2LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIGEgw6ljcml0IDoKPiBI
aSBOZWlsLAo+IAo+IE9uIE1vbiwgTWF5IDIwLCAyMDE5IGF0IDQ6MzggUE0gTmVpbCBBcm1zdHJv
bmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cm90ZToKPj4KPj4gVXBkYXRlIHRoZSBTUERY
IExpY2VuY2UgaWRlbnRpZmllciBmb3IgdGhlIEFtbG9naWMgRFQgYW5kIG1hY2gtbWVzb24KPj4g
ZmlsZXMuCj4+Cj4+IE5laWwgQXJtc3Ryb25nICgxMCk6Cj4+ICAgQVJNOiBkdHM6IG1lc29uOiB1
cGRhdGUgd2l0aCBTUERYIExpY2VuY2UgaWRlbnRpZmllcgo+PiAgIEFSTTogZHRzOiBtZXNvbjYt
YXR2MTIwMDogdXBkYXRlIHdpdGggU1BEWCBMaWNlbmNlIGlkZW50aWZpZXIKPj4gICBBUk06IGR0
czogbWVzb242OiB1cGRhdGUgd2l0aCBTUERYIExpY2VuY2UgaWRlbnRpZmllcgo+PiAgIEFSTTog
ZHRzOiBtZXNvbjgtbWluaXgtbmVvLXg4OiB1cGRhdGUgd2l0aCBTUERYIExpY2VuY2UgaWRlbnRp
Zmllcgo+PiAgIEFSTTogZHRzOiBtZXNvbjg6IHVwZGF0ZSB3aXRoIFNQRFggTGljZW5jZSBpZGVu
dGlmaWVyCj4+ICAgQVJNOiBkdHM6IG1lc29uOGItbXhxOiB1cGRhdGUgd2l0aCBTUERYIExpY2Vu
Y2UgaWRlbnRpZmllcgo+PiAgIEFSTTogZHRzOiBtZXNvbjhiLW9kcm9pZGMxOiB1cGRhdGUgd2l0
aCBTUERYIExpY2VuY2UgaWRlbnRpZmllcgo+PiAgIEFSTTogZHRzOiBtZXNvbjhiOiB1cGRhdGUg
d2l0aCBTUERYIExpY2VuY2UgaWRlbnRpZmllcgo+IHBsZWFzZSBjaGVjayB0aGUgLmR0cyB1cGRh
dGVzIHdpdGggbXkgY29tbWVudCBvbiB0aGUgbWVzb244YiBwYXRjaAo+IGJlY2F1c2UgSSBiZWxp
ZXZlIHRoZXJlIGFyZSB0d28gdHlwb3MgKHdoaWNoIG1hbmFnZWQgdG8gc25lYWsgaW50byB0aGUK
PiByZXN0IG9mIHRoZSBwYXRjaGVzKQoKWW91IGFyZSByaWdodCwgdGhhbmtzIGZvciBwb2ludGlu
ZyBtZSB0byB0aGUgbGljZW5zZXMgdGV4dHMgc3VidGxldGllcywgSSB3YXMgbWlzbGVkIGJ5CnRo
ZSAib2YgdGhlIEdQTCBvciB0aGUgWDExIGxpY2Vuc2UiLi4uIGJ1dCBsb29raW5nIGNsb3NlbHkg
Y2xlYXJseSBzaG93cwphIE1JVCBsaWNlbnNlLgoKV2lsbCByZS1zcGluLgoKTmVpbAoKPiAKPiAK
PiBNYXJ0aW4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
