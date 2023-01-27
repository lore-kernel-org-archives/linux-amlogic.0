Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9A5C54EAA
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 14:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6A4SNm+6hJ0D1k8davsjYc3Hy65wVbOryGSz99NIqU=; b=gDfXHCjqsaM9W0
	Jt07YLEFfDOkdE5BhUczs1PPURUGWqhYjG9LAKRAswwOTiDS6Q4crEkgYyLO2Q4mmn07syQ/FRjac
	OY9EHcoL5yXLrCPRX11sCTnxhlkOC8V6G+NA+F4UFvmZgnZ0590zY9RT7nB7kNaV1kUsphf9gHgQR
	0H1R0j9cq8FU7g+wHX7fG0pWgvZaXXUPRsA/gfVRLkKUinyRpp45vZUFqkwm2DrngFLlkxILlThXx
	MrX6/IpuDvhesU/DvMGzNDJ+5eamU2YAZ9qjd8ESJhnXZ7nq+h/3/JhVD5IiC/3NYE7RSQHHMeza+
	fYHlCicqaxwoCHJCz9mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLPgm-00FHiW-JF; Fri, 27 Jan 2023 14:26:48 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLPgK-00FHYK-FC; Fri, 27 Jan 2023 14:26:24 +0000
Received: by mail-wm1-x332.google.com with SMTP id l8so3566390wms.3;
        Fri, 27 Jan 2023 06:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQvKuWYbN5U9wXSHPFKMRagSKFxuvpjCAy16zSMxd5s=;
        b=ftRyiXQYN4C/taX6rBMEEtJ4FYiYyGbKiMEy1G81lAEO4Undc3m4fU5sqvhUMeA+ce
         trYLUENe8ScOmKriBWOkIlnMg1ZugngJW1/1nxJDUUl53Ei3BN/D1EXIHzRMls7y5gRL
         yngeTRHjSc7ysN2WfKNfsUH9/I/u5YuX+QnjtsT+6OeEqH+xafvfplXA0AWU7UUWXPkb
         p9sXAvP1U5PbzWj8Z7GUfjHvPqUkBblHPDj03g1g8XIltFJblEd1wz2oh9G/QPOjyDNL
         2mpgaUHUw44YNpowOucgnGJNJoko0yFv0A9E/p8TPJV9ltxGkAyWZHJTTSMMCaIMgYGG
         6T4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQvKuWYbN5U9wXSHPFKMRagSKFxuvpjCAy16zSMxd5s=;
        b=YnszZ7L5d9t+4zKdUj+haaZ0z/ntMfn5g+ojsRiRUKW7mDmA7wx+pb/ZZHjMZdWV/6
         pJyT6lv2bDRaMLtNck3rKVBfTMr45ze+/vvWhwlKVrEYUJVvQ/nsDwCMR8UarYECltkJ
         L6CCEG/pm/KrJvOnlDJ+qtqGp9dMlJV4B9ywrNVQtuU9XztWWOwbAaPUGNoGIakhay7t
         eb48vU7lRCEhWSQyDk2Hp88C+dnCBMCd5UYQY+D7o1YoK09E5znSNsF+UwBmWFYA6dOZ
         J4CnPmPC/alvJEzO7+kKr+zltfVqvbBQ5AHTZbGvubaW7JqXtk2sL4YT1gm0KHwy9svJ
         bMtA==
X-Gm-Message-State: AFqh2kpVxpk8s/rrZ8C6XbB+THD8soylgNsgWbBteWfDx1aHOqYdJLyD
	DiOF+iy/RvAASF2VtJbaHEBDJLL5X3ltMg==
X-Google-Smtp-Source: AMrXdXuTsCLLxprVf+MTPCRfzq/gdhb9xh4vISbik9FA0H0my/Cy7zi0t3bSLwwCauop5fVPs0vFMw==
X-Received: by 2002:a05:600c:2d0b:b0:3da:fcf0:a31d with SMTP id x11-20020a05600c2d0b00b003dafcf0a31dmr40316535wmf.22.1674829576580;
        Fri, 27 Jan 2023 06:26:16 -0800 (PST)
Received: from smtpclient.apple ([167.99.200.149])
        by smtp.gmail.com with ESMTPSA id s15-20020a05600c384f00b003d9de0c39fasm9340686wmr.36.2023.01.27.06.26.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Jan 2023 06:26:16 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 4/4] arm64: dts: meson: add support for BananaPi M2-Pro
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <468aef98-2bd7-03d5-0f83-dc58bc4738e9@linaro.org>
Date: Fri, 27 Jan 2023 18:26:12 +0400
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel@vger.kernel.org
Message-Id: <A5EFDCC3-AB2F-464A-B5B6-1B1482D7D9A4@gmail.com>
References: <20230127100236.3385154-1-christianshewitt@gmail.com>
 <20230127100236.3385154-5-christianshewitt@gmail.com>
 <a35f7f09-eb19-6cfc-2053-c6b340f10cbd@linaro.org>
 <356B9EBF-B9C4-4CB0-9F83-9E7A62F93F65@gmail.com>
 <468aef98-2bd7-03d5-0f83-dc58bc4738e9@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_062620_537957_C57063A9 
X-CRM114-Status: UNSURE (   9.19  )
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

Cj4gT24gMjcgSmFuIDIwMjMsIGF0IDU6MDEgcG0sIEtyenlzenRvZiBLb3psb3dza2kgPGtyenlz
enRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4gCj4gT24gMjcvMDEvMjAyMyAxMTox
OSwgQ2hyaXN0aWFuIEhld2l0dCB3cm90ZToKPj4+IEl0J3MgYnkgZGVmYXVsdC4gRGlkIGFueSBE
VFNJIGRpc2FibGUgdGhlIHNvdW5kIG5vZGU/Cj4+IAo+PiBOby4gSeKAmW0gc2ltcGx5IHRyYW5z
Y3JpYmluZyBmcm9tIHRoZSBvcmlnaW5hbCBNNSBkdHMgKHdpdGggZWRpdHMgdG8gb21pdAo+PiB0
aGUgYXVkaW8gamFjayBiaXRzKSBhbmQgdGhlIHNvdW5kIG5vZGVzIG9mIG90aGVyIEFtbG9naWMg
ZHRzIHdoaWNoIGhhdmUKPj4gbG9uZyBpbmNsdWRlZCB0aGUgc2FtZS4gCj4+IAo+PiBRLiBEbyBJ
IG5lZWQgdG8gcmVtb3ZlIGl0IGhlcmU/IChzb3VuZHMgbGlrZSBhIHllcykKPiAKPiBZZXMKCkni
gJl2ZSByZW1vdmVkIGZvciBib3RoIGR0cyBhbmQgc2VudCB2MgoKPj4gUS4gRG8gd2UgbmVlZCB0
byBleG9yY2lzZS9jbGVhbnVwIHRoZSBzYW1lIGZyb20gYWxsIG90aGVyIG1lc29uIGR0cz8KPiAK
PiBZZXMsIHBsZWFzZS4KCknigJlsbCBwdXQgb24gbXkgdG8tZG8gbGlzdCA6KQoKQ2hyaXN0aWFu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
