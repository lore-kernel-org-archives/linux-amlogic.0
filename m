Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F16C77B73
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Apr 2023 12:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9RGbMBJTRgT2WGIdYWI9Z9emtOHSvXaBlCgcfOaZc/o=; b=xsffxjpaaP2Bac
	xcoaNaxMYXEpVlMR9Bfs5F7IgF2zCx6ko92XGr+41xFvC9OoJPJxZAoFHJ+6VSK5IJ21UvnSA2Bkt
	CpJnn49WYExBd8zEeSbdWiWr9DKI+zgFpKHPWcKE9vKNsFP3H/5sFW4DOBvfHLJo0NeHVWRqIP3AU
	WRrW+B3CYBuYIuKzrIsqob0Zw48zhVK7gsQcaqEMxvc3WFBpvrNJLVHxYsalrSjiNO6AeEP5ObkQO
	IPlwfwMEA+0MtzV1EfWx017UNMP3FB2oRwafBeCGJ/UFbh+cqeJ7XRy26ZNH2YGZQb5N/sg4aTM82
	MCQniiWYorsXYjbgh35w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppTZO-0086Q5-2F;
	Thu, 20 Apr 2023 12:39:26 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppTZK-0086Nf-1J
	for linux-amlogic@lists.infradead.org;
	Thu, 20 Apr 2023 12:39:24 +0000
Received: by mail-ej1-x633.google.com with SMTP id dx24so5947493ejb.11
        for <linux-amlogic@lists.infradead.org>; Thu, 20 Apr 2023 05:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681994358; x=1684586358;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=frO9xA4qGK3Raq8henddER4Gj7fo5Lq3c6EyPmzA39U=;
        b=fZuH5/hhYDl86HJZlXgWEAdKy2Wjj+YkTxAJWzXAxlVaW20zc/QIbLhxvG7FguXpji
         j3jQo2H6JIIS3vfjtTD1LQCEFuw1F7fA+RPYkLR8upP1HzWFo69xMN16ojn8VHZvcN7c
         iPMsHojPU6fjNazNFkf5fb8WeSN/FJc1oW20XxS4AmUgdX4cm1gA9vcIm7Lx9RaFk/a7
         jFmDgFM+9MtCJnA8dcLqFdbM2+JrZtq7PrEe+2pEHABehxt/r3XEBpGLpRza769JogAG
         37YlkV6IsSQo7iCplci3XENs4Qk7kmXk4UQYAGI033ehf28WxSN796KDfZxHVRzwmCIA
         z+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681994358; x=1684586358;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=frO9xA4qGK3Raq8henddER4Gj7fo5Lq3c6EyPmzA39U=;
        b=Dvr3SVIiGq9OUT+uUjIm2Qy++sCPGLJe71PBptrVMUW/rSbwHTLFhx5FRSMEQVRrAK
         M4A1qPNYJBiTzuWbKrvDRJIGgFS7tOqTRVkIoVGDKLWWAxENKVwdiiPG/QOeEZA3PQZH
         s8Eg2W1yD7fCOjPj+LgkLLac3QhH4MsLM+XcOF2j7gjuZuaPsFqEvVxXzn9xLo5k9IPQ
         in4eIvXKKjhMrObnBTDsDcISTYeblSsvXkiuwtSPySN1Go5fjKpOWitM7p0rgvGh5ZRv
         JGpS8TeL5YhKxUdxc4KXECq0Nlex3d431PuCElCl+IZk6s68SFokKqIAbAGJv3xKvqeJ
         iMhg==
X-Gm-Message-State: AAQBX9exwdKQh+iNDq4Ur+CE1Ydxq/EotaAYr5uQS8LhSKyQCT1clZN9
	zterUmWnKeT5jJEvPJvc39u4jQ==
X-Google-Smtp-Source: AKy350Z8LjQ8yEXBqV1QNKNQSYXwoxzmB7xhaYEUEDq6AZRkT+w7troCaBLcm+1WAcJyPN8xGEfDeA==
X-Received: by 2002:a17:906:115a:b0:94e:8431:4767 with SMTP id i26-20020a170906115a00b0094e84314767mr1528797eja.38.1681994358651;
        Thu, 20 Apr 2023 05:39:18 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bcb8:77e6:8f45:4771? ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id fh22-20020a1709073a9600b0094efc389980sm689608ejc.58.2023.04.20.05.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 05:39:18 -0700 (PDT)
Message-ID: <a28766ff-39aa-7e10-394a-6f4db524fff9@linaro.org>
Date: Thu, 20 Apr 2023 14:39:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 1/2] arm64: amlogic: add new ARCH_AMLIPC for IPC SoC
Content-Language: en-US
To: Kelvin Zhang <kelvin.zhang@amlogic.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: =Xianwei Zhao <xianwei.zhao@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230419073834.972273-1-xianwei.zhao@amlogic.com>
 <20230419073834.972273-2-xianwei.zhao@amlogic.com>
 <20230419131416.cns3xvkbzjeyrnux@CAB-WSD-L081021>
 <661cea17-a4dd-75d1-6a7e-16efa5aea52b@linaro.org>
 <20230419160405.d7qfir3nv6tlxx2a@CAB-WSD-L081021>
 <427e79ef-156d-027e-9296-6f4e6513a04d@linaro.org>
 <20230419170043.auzfa32weevmrt4e@CAB-WSD-L081021>
 <1c7322c9-8d2d-1cd1-95dc-dd9ec861981f@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1c7322c9-8d2d-1cd1-95dc-dd9ec861981f@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_053922_461464_EF4080D0 
X-CRM114-Status: GOOD (  23.38  )
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

T24gMjAvMDQvMjAyMyAxMDo0MywgS2VsdmluIFpoYW5nIHdyb3RlOgo+Pj4+Pj4+ICtjb25maWcg
QVJDSF9BTUxJUEMKPj4+Pj4+IERvIHdlIHJlYWxseSBuZWVkIGEgZGlmZmVyZW50IEFSQ0ggZm9y
IEFtbG9naWMgSVBDPwo+Pj4+Pj4gSSBjYW4gaW1hZ2luZSB0aGF0IGl0J3Mgbm90IHRoZSBNZXNv
biBhcmNoaXRlY3R1cmUgYXQgYWxsLgo+Pj4+Pj4gQnV0IG1heWJlIGEgYmV0dGVyIHNvbHV0aW9u
IGlzIGp1c3QgdG8gcmVuYW1lIEFSQ0hfTUVTT04gdG8gQVJDSF9BTUxPR0lDPwo+Pj4+PiBJdCBz
aG91bGQgYmUgY2hhbmdlZCB0cmVld2lkZSwgYW5kIGlzIGl0IHdvcnRoIGl0ID8KPj4+PiBBcyBm
YXIgYXMgSSB1bmRlcnN0YW5kLCB0aGUgQTEgYW5kIFM0IGZhbWlsaWVzIGFyZSBub3QgZnVsbHkg
Y29tcGF0aWJsZQo+Pj4+IHdpdGggdGhlIE1lc29uIGFyY2hpdGVjdHVyZSwgYW5kIHdlIGhhdmVu
J3QgcHJvdmlkZWQgYWRkaXRpb25hbCBBUkNIXyoKPj4+PiBmb3IgdGhlbS4KPj4+IFRoZSBHWEJC
LCBHWEwvR1hNLCBHMTJBLCBHMTJCICYgU00xIGFyZSBhbHNvIG5vdCBmdWxseSBjb21wYXRpYmxl
LAo+Pj4gYnV0IHRoZXkgbGllIHVuZGVyIHRoZSAiTUVTT04iIHVtYnJlbGxhIHdoaWNoIGNvdmVy
cyBTb0Mgc2luY2UgdGhlCj4+PiBNZXNvbjYgYXJjaGl0ZWN0dXJlLiBJdCdzIGEgZmFjaWxpdHkg
dG8gaW5jbHVkZS9leGNsdWRlIEFtbG9naWMKPj4+IGRyaXZlcnMvRFQsIG5vdGhpbmcgZWxzZS4K
PiBHWEJCLCBHWEwvR1hNLCBHMTJBLCBHMTJCICwgU00xIGFuZCBTNCBiZWxvbmcgdG8gbWVkaWEg
Ym94Lgo+IFNvLCAiTUVTT04iIHJlcHJlc2VudHMgdGhlIG1lZGlhIGJveCBzZXJpZXMuCj4gVXAg
dG8gbm93LCAiTUVTT04iIHdvcmtzIHdlbGwgZm9yIGFsbCBleGlzdGluZyBjaGlwcyBleGNlcHQg
QTEgYW5kIEFYRy4KPj4+IElmIHlvdSBjb21wYXJlIGl0IHRvIEJDTSBvciBOWFAsIGl0J3MgZGlm
ZmVyZW50IHNpdHVhdGlvbiwgdGhlCj4+PiBkaWZmZXJlbnQgQVJDSF8qIGFjdHVhbGx5IHRhcmdl
dHMgdG90YWxseSBkaWZmZXJlbnQgU29DcyBmcm9tCj4+PiBjb21wbGV0ZWx5IGRpZmZlcmVudCBC
dXNpbmVzcyBVbml0cyBvciBmcm9tIGNvbXBhbmllcyBhY3F1aXNpdGlvbnMuCj4gRmlyc3RseSwg
dGhlIG5ldyBDIHNlcmllcyBpcyB0b3RhbGx5IGRpZmZlcmVudCBmcm9tIHByZXZpb3VzIE1FU09O
IHNlcmllcy4KPiAgRnJvbSB0aGUgcGVyc3BlY3RpdmUgb2YgYXBwbGljYXRpb24sIHRoZSBuZXcg
QyBzZXJpZXMgaXMgZGVzaWduZWQgZm9yIAo+IHNtYXJ0IElQIGNhbWVyYSBhcHBsaWNhdGlvbnMs
Cj4gd2hpbGUgTUVTT04gc2VyaWVzIGlzIGRlc2lnbmVkIGZvciBoeWJyaWQgT1RULyBJUCBTZXQg
VG9wIEJveMKgIGFuZCAKPiBoaWdoLWVuZCBtZWRpYSBib3ggYXBwbGljYXRpb25zLgo+ICBGcm9t
IHRoZSBwZXJzcGVjdGl2ZSBvZiBhcmNoaXRlY3R1cmUsIHRoZSBuZXcgQyBzZXJpZXMgaW50ZWdy
YXRlcyB0aGUgCj4gc2Vuc29yIGludGVyZmFjZSwgaW1hZ2Ugc2lnbmFsIHByb2Nlc3NpbmcgdW5p
dCwgRGV3YXJwLCB2aWRlbyBlbmNvZGVyLCAKPiBuZXVyYWwgbmV0d29ya2luZyBwcm9jZXNzaW5n
IHVuaXQsCj4gd2hpY2ggTUVTT04gc2VyaWVzIGRvZXMgbm90IGFuZCB3aWxsIG5ldmVyIGhhdmUu
Cj4gU2Vjb25kbHksIHRoZXJlIGFyZSBDMSBhbmQgQzIgYmVzaWRlcyBDMy4KPiBNb3Jlb3Zlciwg
bW9yZSBvdGhlciBzZXJpZXMgYXJlIG9uIHRoZSB3YXksIHN1Y2ggYXMgVCBzZXJpZXMuCj4gSWYg
d2UgYWx3YXlzIHN0aWNrIHRvICJNRVNPTiIsIHBlb3BsZSB3aWxsIGdldCBtb3JlIGFuZCBtb3Jl
IGNvbmZ1c2VkLgo+IFRoZXJlZm9yZSwgSSB0aGluayBpdCBpcyB0aGUgcmlnaHQgdGltZSB0byBh
ZGQgQVJDSF9BTUxJUEMuCgpZb3VyIERUUyB1c2VzIGNvbXBhdGlibGVzIGZyb20gbWVzb24sIHNv
IEkgd291bGQgYXJndWUgdGhhdCBpdCBpcyBzdGlsbApwYXJ0IG9mIHRoZSBzYW1lIGFyY2hpdGVj
dHVyZS4KCkFueXdheSwgdGhpcyBpcyBqdXN0IGNvbmZpZyBzeW1ib2wsIHNvIGl0IGRvZXMgbm90
IG1hdHRlci4gVGhlcmUgd2lsbCBiZQpubyBjb25mdXNpb24gYW5kIG5vIHByb2JsZW0gb2Yga2Vl
cGluZyBpdCBBUkNIX01FU09OLgoKCj4+PiBXZSBzaG91bGQgaGF2ZSBuYW1lZCBpdCBBUkNIX0FN
TE9HSUMgc2luY2UgdGhlIGJlZ2lubmluZywgYnV0IHdlCj4+PiBjYW4ndCBjaGFuZ2UgaGlzdG9y
eS4KPiBTaG91bGRuJ3Qgd2UgZGVzZXJ2ZSBhIGNoYW5jZSB0byBtYWtlIGl0IHJpZ2h0Pwo+Pj4+
IEluIG15IG9waW5pb24sIGl0J3MgYSBnb29kIHRpbWUgdG8gc3BsaXQgdGhlIE1lc29uIGFyY2hp
dGVjdHVyZSBpbnRvCj4+Pj4gcHJvcGVyIHN1YnNldHMsIG9yIHJlbmFtZSBpdCB0cmVld2lkZSAo
bWF5YmUgb25seSBjb25maWcgb3B0aW9uCj4+Pj4gQVJDSF9NRVNPTiA9PiBBUkNIX0FNTE9HSUMp
Lgo+Pj4gTUVTT04gaXMgb25seSBhIGNvZGVuYW1lIHRvIGRpZmZlcmVudGlhdGUgZnJvbSBvdGhl
ciBTb0MgdmVuZG9ycwo+Pj4gYmVjYXVzZSBBbWxvZ2ljIHVzZWQgaXQgYXMgYSBjb2RlbmFtZSBm
b3IgYSBsb25nIHRpbWUuCj4+PiBDb21wYXJlIHRoaXMgdG8gQWxsd2lubmVyJ3MgInN1bnhpIiBv
ciBRdWFsY29tbSdzICJtc20iLgo+Pj4KPj4+IFRoaXMgY29uZmlnIGhhcyBubyBmdW5jdGlvbmFs
IG1lYW4sIGl0J3Mgb25seSBhIGNvbmZpZyBuYW1lc3BhY2UuCj4+Pgo+Pj4gUmVuYW1pbmcgaXQg
d291bGQgbmVlZCByZW5hbWluZyBpdCBpbiBhbGwgc3Vic3lzdGVtcyBLY29uZmlnL01ha2VmaWxl
cwo+Pj4gYW5kIHdpbGwgY2VydGFpbmx5IGJyZWFrIGJ1aWxkcyB3aXRoIGN1c3RvbSBrZXJuZWwg
Y29uZmlncwo+Pj4gaW4gdmFyaW91cyBwdWJsaWNseSB1c2VkIGJ1aWxkcyBsaWtlIEFybWJpYW4s
IG1ldGEtbWVzb24sIExpYnJlRUxFQywKPj4+IERlYmlhbiwgU3VzZSwgLi4uCj4gTGV0J3MgZ2V0
IGJhY2sgdG8gQVJDSF9BTUxJUEMuCj4gV2UganVzdCBuZWVkIHRvIGFkZCBBUkNIX0FNTElQQyBp
biB0aGUgbmVjZXNzYXJ5IHN1YnN5c3RlbXMgCj4gS2NvbmZpZy9NYWtlZmlsZS4KPiBUaGlzIGNo
YW5nZSB3aWxsIGtlZXAgdGhlIGV4aXN0aW5nIE1FU09OIHJlbGF0ZWQgY29kZSzCoCBhbmQgd2ls
bCBuZWl0aGVyIAo+IGludm9sdmUgcmVuYW1pbmcgbm9yIGJyZWFrIGFueSBidWlsZHMuCgpJdCBp
cyBhbHNvIG5vdCBuZWNlc3NhcnkgYW5kIG5vdCBqdXN0aWZpZWQuIFdlIGRvIG5vdCBoYXZlIG11
bHRpcGxlCnRvcC1sZXZlbCBzdWJhcmNocyBmb3Igb25lIGFyY2hpdGVjdHVyZS4gV2UgaGFkIHN1
Y2ggdGFsa3MgYWxyZWFkeSBhbmQKdGhlcmUgd2FzIG5vIGNvbnNlbnN1cyB0byBjaGFuZ2UgaXQu
CgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
