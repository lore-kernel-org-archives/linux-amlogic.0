Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85191606A322
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Nov 2026 08:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mc0yAm9C;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gAFFYgER
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=16WO39LoN7jJA4EAGvJsQ4At8yOEQY46v8+Vp8A6jqE=; b=mc0yAm9CUyPK6oiDzeHeaIX0mz
	xTvg5OTT3g743eHmRCJmfp8roTQw97WodKRB7L8ghNj1z0w0Z2LeEaDjOD6B6T/iwAy+/fxSTgLWV
	EDmveJfoJwscIhbSyL32I8b3hKYWuTKd69dYo3Vpgem4cGxnVFzbbuIOUWx8kAwQyOFsLk7gKo2Qe
	bD6LmwG5UyKlOn4PK6P3T7A7w/qelksSNKdMBUaTS+CsbpO7iU6nsEwdh/oKuXw0pU8EHfRk5d9gO
	wfsN+6MnNp29ldKP37o9icLU6jne5gJBIzEGhsUpmI+Oa4KyN68Nj/Dt219aPNUbo0cgZLp+gb+lW
	l651tjZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKz7-000000006fW-3nny;
	Mon, 09 Nov 2026 08:44:14 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKz5-000000006em-05uZ
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Nov 2026 08:44:12 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48e09aa5264so327628f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Nov 2026 00:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794213848; x=1794818648; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wmoE0o+usurqRULoy3dgPzQt8WkDzf6jK8UVMHR65yY=;
        b=gAFFYgER5y18IJ5admZP496UJ2VP3CVFBXbiyVdutoff9oj9u7zDb4OIyXXX0Txkz4
         JSmBPoNYyz8MUMoW2WlmFYDUcfzOWbZlX/GTSsw6dp4eigApe/6kC4tVa8uzeQo1tSns
         TdaLu6cIQyFoByAMzFLUgCdDscg/E90DENZivyyAWx5D2z9udgrcVVxdmKlS2wdTiBr+
         5yjZUQ0ojb6akQdXY6A36yzur5zommV6ah82pPBDBuCUXRoUdsSDySb47BpJQl+6q57C
         tglLq9nbTqk99cC1YQm9XqkFgDiDvKnoY9n9UvJl+gTC8w8GO61d7Bbhxl6pQnFXJrUa
         YGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213848; x=1794818648;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wmoE0o+usurqRULoy3dgPzQt8WkDzf6jK8UVMHR65yY=;
        b=eCBMrvWuYFUVb36vUoxOG7300u9ulKKp2iiqcCV+2AsRGD6hLZVxCkg676fyswQnBW
         dvg5BFVSZSaqJgI+oPF1yUoPgevQ1OlwCrvMDfghGU0AzsNOZ56Osu+Ad25LPNEB/ChN
         CiupQJthuHXGmrf4s83QMsHB9QFiFn5o+8FrMkrOEMmRKbSB+QGCsivC56NV7W40T3Z9
         xUjiN9GZChdht8MdLoVGAX0zm0ZbolVddkqUenpwiJfQYkmbdXu8Wrp3OOUAgG3lHEBS
         MUp/T1tDf0oMPigZ4SNFXmQW+PrKJPVoB4EZOZM02TdTqPez6tonzCjFs6whmEo+9ovS
         r5Rw==
X-Forwarded-Encrypted: i=1; AL+hErE60vlx/vwOm2yNWE3akVjOL+xqAqwXRThuKoUIDK58OsKE1KupfWl+mYAgh31ckHsszQ6lAGMJrUzft16r@lists.infradead.org
X-Gm-Message-State: APuU4Z8Y4ATN9aGjMZ+eYKbpuJQb7Ihu48ZvsSJVwiuHTInkjSaAmA6F
	BIjcFdfukQLIBRz8QRuFmVNR78K13MIO67Em/rQUyavI/xA/Ucg/GBPvszQDiPBGWtE=
X-Gm-Gg: AYBFou1nyfLVYcGExZspJ7UGXqcEEAuzpjzn7VU0NqWErLb2z7Frzoaa1bUZGbl7J70
	Ts5uHetlvrvqVtLcvxjER/9fsJP3ggsVkU7FMyK7c1E+IN6Ggcq/rxzwG0gsg5J5R0qz76dLHmZ
	SuStvsl3JKuIT06R2IzX8Dt3x0m/D9UtRl9WY4rEayrHLQWSGRcjDjvqG0/OrN+L0/jL8rEQTNR
	TylLRSwcU9UESSZbYIfn4yEOoBZ1FHGBTL7QPolaBuSuXzLqC8i4SWtrShhxb4/tcceWiUrsRMm
	bV2T/ceDcuUVg2Xy4daxvZoBxMirceRi/s99zuvTjNpqt1jDvy5xRto3M1Usj+Y9+88u5BOpRy+
	NJuRuK9yfJ+IZO7QY0Y2qDELtYabwyJhhiLvFx/Mz7rfR5inPa7VmQS74JQqMYjc+YSwMCD1l0t
	gC8N32YCAQgiHzRRa/crk9MVhwYfQwnxgBGgka+ctoXPn7C3cLZQQPhpqkV82Au7qAS6/JDI83B
	vCMEsThivliyFvZ+Vg22369hfgBQySV7tmxrN5EgD4ECQxL+oa88s8O5oN2ynWzVTrL7gfCzxDG
	1uJvxqC5noIPSu+NWye1vP3LdZh+kbPrpM5vC5+pP/xwP+Cuoixh7aLfbfEGehrQBeZLbK00YJw
	SD3jyyilc0w==
X-Received: by 2002:a05:6000:2485:b0:48d:ffa3:714 with SMTP id ffacd0b85a97d-49582bad522mr8029699f8f.19.1794213847391;
        Mon, 09 Nov 2026 00:44:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:6762:47bb:1e06:ff70? ([2a01:e0a:106d:1080:6762:47bb:1e06:ff70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f398a4sm8133300f8f.6.2026.11.09.00.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 00:44:06 -0800 (PST)
Message-ID: <317f2930-9f65-447e-aa46-223ba9e47033@linaro.org>
Date: Mon, 9 Nov 2026 09:44:05 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chuan Liu <chuan.liu@amlogic.com>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
 <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
 <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com>
 <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
 <CAFBinCBkJJeRPKLFBA9KYjwXMxFjow_NOtvFoKRQdxD=rOPW3w@mail.gmail.com>
 <48b333a3-ef88-4739-a087-3ed9d8ec60a4@amlogic.com>
 <CAFBinCCgmRmk--W53wqdJhF-SzJbai--s7wyzDNt3LpfN00spw@mail.gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <CAFBinCCgmRmk--W53wqdJhF-SzJbai--s7wyzDNt3LpfN00spw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_004411_130814_E04A97FB 
X-CRM114-Status: GOOD (  32.67  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: robh@kernel.org, conor+dt@kernel.org, christian.koever-draxl@student.uibk.ac.at, rafael@kernel.org, sboyd@kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>, devicetree@vger.kernel.org, khilman@baylibre.com, linux-amlogic@lists.infradead.org, krzk+dt@kernel.org, bmasney+clk@redhat.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTEvOC8yNiAyMjo0NSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBPbiBUdWUsIE5v
diAzLCAyMDI2IGF0IDEwOjQ24oCvQU0gQ2h1YW4gTGl1IDxjaHVhbi5saXVAYW1sb2dpYy5jb20+
IHdyb3RlOgo+Pgo+PiBIaSBNYXJ0aW4sCj4+ICAgICAgIFRoYW5rIHlvdSBmb3Igam9pbmluZyB0
aGlzIGRpc2N1c3Npb24uIDopCj4+Cj4+IEkgaGF2ZSByZS1leGFtaW5lZCB0aGUgY2FwYWJpbGl0
aWVzIHByb3ZpZGVkIGJ5IHBtX29wcCBhbmQgY3B1ZnJlcS1kdCwKPj4gYW5kIGl0IHNlZW1zIHRo
YXQgd2UgbWF5IGFsc28gYmUgYWJsZSB0byBhZGFwdCBBOSBmYWlybHkgd2VsbCBiYXNlZCBvbgo+
PiB0aGUgYW1sb2dpYy1jcHVmcmVxLmMgaGVyZS4gU28gd2UgaGF2ZSBubyBvYmplY3Rpb25zIHRv
IHRoZSBkcml2ZXIKPj4gaW1wbGVtZW50YXRpb24gaW4gYW1sb2dpYy1jcHVmcmVxLmMgaGVyZS4K
Pj4KPj4gSSB3YXMgbW9zdCB3b3JyaWVkIGFib3V0IGJlZm9yZSB3YXMgdGhhdCBjcHVmcmVxLWR0
IG1pZ2h0IG5vdCBmdWxseQo+PiBoYW5kbGUgdGhlIGNvbXBsaWNhdGVkIGNsb2NrIGFuZCBzdXBw
bHkgYWRqdXN0bWVudCBsb2dpYyBiZXR3ZWVuCj4+IG11bHRpcGxlIGNsdXN0ZXJzLCB3aGljaCB3
b3VsZCBoYXZlIHJlcXVpcmVkIGFkZGluZyBhIHNlcGFyYXRlCj4+IGNwdWZyZXFfZHJpdmVyLiBC
dXQgaXQgbm93IGxvb2tzIGxpa2UgdGhpcyBjYW4gYmUgc29sdmVkIGJ5IGFkZGluZyB0aGUKPj4g
Y29ycmVzcG9uZGluZyBjb25maWdfY2xrcygpIGFuZCBjb25maWdfcmVndWxhdG9ycygpIGNhbGxi
YWNrcyBpbgo+PiBkZXZfcG1fb3BwX3NldF9jb25maWcoKS4KPiBUaGF0J3MgZ3JlYXQgbmV3cywg
aW5kZWVkIQo+IAo+IFsuLi5dCj4+PiAtIE1lc29uOC84Yi84bTIgKDMyLWJpdCBBUk0gQ29ydGV4
LUE1L0E5KSB3aGVyZSB3ZSBuZWVkIHRvIHJlcGFyZW50Cj4+PiB0aGUgQ1BVIGNsb2NrIHRvIFhU
QUwgZm9yIHN0YWJsZSBvcGVyYXRpbmcgZHVyaW5nIGNsb2NrIGNoYW5nZXMgKHdoaWNoCj4+PiBz
aG91bGQgZ28gaW50byBhIGNwdWZyZXEgZHJpdmVyIHRoYXQgaW1wbGVtZW50cyB0YXJnZXRfaW50
ZXJtZWRpYXRlKS4KPj4+IFRoZXJlJ3Mgbm8gc2VjdXJlIG1vbml0b3Igb3IgZmlybXdhcmUgaW52
b2x2ZWQgZm9yIENQVSBjbG9ja3MuCj4+Cj4+IEJUVywgY291bGQgd2UgcHV0IHRoZSBDUFUgY2xv
Y2sgaGFuZGxpbmcgbG9naWMgaW4gdGhlIGNsb2NrIGRyaXZlciBsaWtlCj4+IEcxMkEgZG9lcyAo
dGhvdWdoLCBvZiBjb3Vyc2UsIGhhbmRsaW5nIGl0IGluIHRoZSBjcHVmcmVxIGRyaXZlciBtaWdo
dAo+PiBtaW5pbWl6ZSB0aGUgY291cGxpbmcgYmV0d2VlbiB0aGUgY2xvY2sgYW5kIGNwdWZyZXEg
ZHJpdmVycyk/IFRoYXQgd2F5Cj4+IHdlIGNvdWxkIGZ1bGx5IHJldXNlIHRoZSBleGlzdGluZyBj
cHVmcmVxLWR0Pwo+IENvbW1vbiBjbG9jayBmcmFtZXdvcmsgbWFpbnRhaW5lcnMgZG9uJ3Qgd2Fu
dCBtdXhlcyB0byBiZSBwcm9ncmFtbWVkCj4gbWFnaWNhbGx5IGluIGNsb2NrIG5vdGlmaWVycyAo
d2hpY2ggaXMgd2hhdCBHMTJBIGFuZCBNZXNvbjgqIGRvKS4KPiBTbyB0aGVyZSdzIGEgY2hhbmNl
IHRoYXQgZm9yIG5ldyBkcml2ZXJzIHRoZXkgd291bGQganVzdCBOQUNLIHRoYXQgYXBwcm9hY2gu
Cj4gSSBkb24ndCByZWNhbGwgdGhlIGV4YWN0IHJlYXNvbiBhbnltb3JlIC0gYnV0IGZyb20gbXkg
cGVyc3BlY3RpdmUKPiB1c2luZyBhIGNwdWZyZXEgZHJpdmVyIGZvciB0aGlzIGlzIHRoZSBjbGVh
bmVzdCBhcHByb2FjaCAoYWx0aG91Z2ggYQo+IGZldyBsaW5lcyBvZiBjb2RlIGV4dHJhKS4KCkl0
IHdvdWxkIG1vdmUgdGhlIHNvYy1zcGVjaWZpYyBsb2dpYyBmcm9tIGEgc29jLXNwZWNpZmljIGNs
ayBkcml2ZXIKdG8gc29jIHNwZWNpZmljIGNwdWZyZXEgdHJlZSBoYW5kbGluZyBjbG9jayBtdXhp
bmcuIEkga2luZCBvZgpkaXNhZ3JlZSBvbiB0aGlzIGFwcHJvYWNoLiBJZiBzb21lIGxvZ2ljIGlz
IG5lZWRlZCB0byBoYW5kbGVkIGNsb2NrCnBhcmtpbmcgd2hpbGUgc3dpdGNoaW5nIGNsb2NrIHN1
Yi10cmVlcyBhbmQgbm90aWZpZXJzIGlzIG5vdAphY2NlcHRlZCB0aGVtIHRoZSBDQ0Ygc2hvdWxk
IGV2b2x2ZSB0byBoYW5kbGUgdGhhdCwgbm90IG1vdmluZwp0aGlzIGxvZ2ljIGVsc2V3aGVyZSBh
bmQgaGF2ZSBhIHByb2xpZmVyYXRpb24gb2YgY2xrIG11eCByZWxhdGVkCmNvZGUgaW4gY3B1ZnJl
cS4KCj4gCj4gQWRkaXRpb25hbGx5OiBJIGJlbGlldmUgdGhlIHVkZWxheSgxMDApIGluIHRoZSBH
MTJBIGFuZCBNZXNvbjgqCj4gaW1wbGVtZW50YXRpb24gaXMgbm90IGV2ZW4gY2xvY2sgcmVsYXRl
ZCBidXQgYSBkZWxheSB0byB3YWl0IGZvciB0aGUKPiByZWd1bGF0b3IgdG8gYmVjb21lIHN0YWJs
ZS4KCkl0J3MgaGlnaGx5IHByb2JhYmxlCgo+IAo+Pj4gLSBHWEJCL0dYTC9HWE0gdXNlIFNDUEkg
ZmlybXdhcmUgQ1BVIGNsb2NrIGNvbnRyb2wgc28gdG8gbXkga25vd2xlZGdlCj4+PiB3ZSdyZSBn
b29kIHdpdGggd2hhdCB3ZSBoYXZlIChtZWFuaW5nOiBubyBjdXN0b20gY3B1ZnJlcSBkcml2ZXIK
Pj4+IG5lZWRlZCkKPj4+IC0gRzEyQSBzaW5nbGUgY2x1c3Rlciwgbm8gRFNVOiBuZWVkcyBhIGNw
dWZyZXEgZHJpdmVyIHRoYXQgaW1wbGVtZW50cwo+Pj4gdGFyZ2V0X2ludGVybWVkaWF0ZSAoY3Vy
cmVudGx5IGl0J3MgbWFuYWdlZCBvbiBjbG9jayBkcml2ZXIgc2lkZSBpbgo+Pj4ga2VybmVsIHNw
YWNlLCBubyBmaXJtd2FyZSBpbnZvbHZlZCkKPj4+IC0gRzEyQiBtdWx0aSBjbHVzdGVyLCBubyBE
U1U6IG5lZWRzIGEgY3B1ZnJlcSBkcml2ZXIgdGhhdCBpbXBsZW1lbnRzCj4+PiB0YXJnZXRfaW50
ZXJtZWRpYXRlIChjdXJyZW50bHkgaXQncyBtYW5hZ2VkIG9uIGNsb2NrIGRyaXZlciBzaWRlIGlu
Cj4+PiBrZXJuZWwgc3BhY2UsIG5vIGZpcm13YXJlIGludm9sdmVkKQo+Pgo+PiBUaGUgY3B1ZnJl
cS1yZWxhdGVkIHJlc291cmNlcyBvbiB0aGUgU29DcyBtZW50aW9uZWQgYWJvdmUgYXJlIHJlbGF0
aXZlbHkKPj4gY2xlYW46IGVhY2ggY2x1c3RlciBoYXMgb25seSBvbmUgaW5kZXBlbmRlbnQgY2xv
Y2sgYW5kIHN1cHBseSBvZiBpdHMKPj4gb3duLCBhbmQgdGhlc2UgU29DcyBhbHNvIGRvIG5vdCBz
dXBwb3J0IHZvbHRhZ2Ugc2VsZWN0aW9uIGJhc2VkIG9uIGNoaXAKPj4gYmlubmluZy4KPiBUaGF0
IG1ha2VzIHRoaW5ncyBzaW1wbGUsIGluZGVlZDogZWFjaCBjbHVzdGVyIGZvbGxvd3MgdGhlIHNh
bWUgbG9naWMKPiB1c2luZyBpdCdzIG93biByZXNvdXJjZXMuCj4gCj4+PiAtIFNNMSBzaW5nbGUg
Y2x1c3RlciBhbmQgRFNVOiBuZWVkcyBhIGNwdWZyZXEgZHJpdmVyIHRoYXQgaW1wbGVtZW50cwo+
Pj4gdGFyZ2V0X2ludGVybWVkaWF0ZSAoY3VycmVudGx5IGl0J3MgbWFuYWdlZCBvbiBjbG9jayBk
cml2ZXIgc2lkZSBpbgo+Pj4ga2VybmVsIHNwYWNlLCBubyBmaXJtd2FyZSBpbnZvbHZlZCkKPj4K
Pj4gQ29tcGFyZWQgd2l0aCB0aGUgU29DcyBhYm92ZSwgdGhlIGRpZmZlcmVuY2UgZm9yIFNNMSBp
cyB0aGF0IGl0IG5lZWRzIHRvCj4+IGFkZGl0aW9uYWxseSBtYW5hZ2UgYSBEU1UgY2xvY2suIElu
IHRoaXMgY2FzZSwgdGhlIGNsb2NrLXJlbGF0ZWQKPj4gaGFuZGxpbmcgY2FuIGJlIGFkZGVkIGlu
IGRldl9wbV9vcHBfc2V0X2NvbmZpZygpIGluIGFtbG9naWMtY3B1ZnJlcS5jCj4+IChieSBpbXBs
ZW1lbnRpbmcgY2xrX25hbWVzIGFuZCBjb25maWdfY2xrcyBpbiBzdHJ1Y3QgZGV2X3BtX29wcF9j
b25maWcpLgo+IEkgdGhpbmsgc28gZmFyIG1haW5saW5lIGlzIG5vdCB0b3VjaGluZyB0aGUgRFNV
IGNsb2NrIGF0IGFsbC4KPiAKPiBbLi4uXQo+PiBBbGwgaW4gYWxsLCBpdCBsb29rcyBsaWtlIHdl
IGNhbiBjdXJyZW50bHkgc3VwcG9ydCBhbGwgQW1sb2dpYyBTb0NzIGluIGEKPj4gc2luZ2xlIGFt
bG9naWMtY3B1ZnJlcS5jPyBUaGVuLCBmb3IgdGhlIHNwZWNpZmljIGNoYXJhY3RlcmlzdGljcyBv
Zgo+PiBkaWZmZXJlbnQgU29Dcywgd2UgY2FuIGRpZmZlcmVudGlhdGUgdGhlbSB0aHJvdWdoIHRo
ZSAiY29tcGF0aWJsZSIKPj4gcHJvcGVydHkgYW5kIGFkZCB0aGUgY29ycmVzcG9uZGluZyBkcnZk
YXRhIGZvciBlYWNoLgo+Pgo+PiBJJ2xsIGFsc28gdHJ5IHRvIHN1cHBvcnQgUzcvQTkgd2l0aCBy
ZXByZXNlbnRhdGl2ZSBkaWZmZXJlbmNlcyBiYXNlZCBvbgo+PiB0aGlzIHBhdGNoLgo+IEdyZWF0
LCBsZXQncyBsb29rIGF0IHNvbWUgY29kZSByYXRoZXIgdGhhbiBkaXNjdXNzaW5nIHRoZW9yeSBv
biBob3cgdG8KPiB3cml0ZSBjb2RlIDotKQo+IAo+IFRoZXJlJ3Mgb25lIGxhc3QgZGV0YWlsIHRo
YXQgd2UgaGF2ZSB0byBtYW5hZ2UgaW4gY2FzZSB3ZSBhbHNvIHdhbnQgdG8KPiBpbmNsdWRlIHRo
ZSBNZXNvbjgqIGNvZGUgaW50byB0aGUgc2FtZSBmaWxlOgo+IGNvbmZpZyBNRVNPTl9TTSBkZXBl
bmRzIG9uIEFSTTY0XzRLX1BBR0VTCj4gMzItYml0IGtlcm5lbCBidWlsZHMgY2FuJ3Qgc2F0aXNm
eSB0aGlzIChtZWFuaW5nOiB3ZSBlbmQgdXAgd2l0aAo+IGxpbmtlciBlcnJvcnMpLiBJIHRoaW5r
IGEgc2ltcGxlIHdheSB0byBnZXQgYXJvdW5kIHRoaXMgaXMgdG8gYWRkIHN0dWIKPiBmdW5jdGlv
bnMgdG8gaW5jbHVkZS9saW51eC9maXJtd2FyZS9tZXNvbi9tZXNvbl9zbS5oLgo+IEknbGwgdGFr
ZSBjYXJlIG9mIHRoYXQgb25jZSBJIGNhbiBzdWJtaXQgTWVzb244IHN1cHBvcnQgcGF0Y2hlcyBm
b3IKPiB5b3VyIHVwY29taW5nIGFtbG9naWMtY3B1ZnJlcS5jIQo+IAo+IAo+IEJlc3QgcmVnYXJk
cywKPiBNYXJ0aW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
