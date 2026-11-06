Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A759E606A326
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SCjXtSL0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ym2465ik
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ysVm+KrANpy3uNy9ywNGWFLZZ/c5w+qsvQk55oOrKl4=; b=SCjXtSL0welv6ZCwRmDG/q+zNg
	oI3f071WOmnyp/xhbi4oeJzf3HC9NAXFmMpqNM0ybXWsd/A/oLbnpJQ4Tb+92R+QUPmPQnlUkM+/K
	lg+xf7RdrW8jZH9EozpKRhhA3UcI4rnL3r/iYwcjVmhbv7OnTM6Dpjzl44UvLnQklzNU/fBAj+H4h
	auMERwAW9R4zyZURyt/ECk0UZOf/FejGQt/2/1D6deVYD0m7jRJuv6NRVIuACa1bFDntMJhakcje3
	Oo5n3yslfwNeKFwMABq5qSHrqDTwhwOBjzccMr+gqHznwBLgVfeCAU0ENQE7QeTi1tR8ahsJoapK8
	DiMsrQxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHbP-0000000C3YF-2GU7;
	Fri, 06 Nov 2026 10:55:23 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHb9-0000000C3Uy-1A34
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 10:55:22 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so4849625e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Nov 2026 02:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793962505; x=1794567305; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=296xUxU8tn6mPRnshqQK79RjtnZgHDOcCRgt0Ddd2s8=;
        b=ym2465ikYZHM4EGU2rSvoID3FDMvrX1uzvJvqb5JxPNEvA5evcF5T/UK12O2XdqEzf
         rDAXjZo+JtBDDdag5dCZzsdIv/PRHSLBh8ykb8ppA+Fk2hk7UFJ0/ype6NPbDj3wgKmU
         y/ms7Ca7fnUJDyn7ud586HcROdLgb/xZIS6bMDK3UxgxSpb7E/kkX/fMzMLiU9j8ycFN
         Nc+t80HXG0+hXyo7L88Euy6ygrGvWFH9wgC3qCcWFQVfYkVVzuKqhSlnIHLCo5D5oi01
         v97na2pFvT1X0d7vdhWtknZoOtlqzVWUq+Wse7Beq896DDSOGzxqIkuDGm438zzzvWGa
         VmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962505; x=1794567305;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=296xUxU8tn6mPRnshqQK79RjtnZgHDOcCRgt0Ddd2s8=;
        b=xVXb2/wepcibvSPqOENwjlsRSm6gVQKSpJbO7uu6+fIdrPvHU1MYYbGZKjqlOkXv9m
         pLke9uOGGAhOsKRdaS55DBbijHdA/nS8mocQOTvuupdiLmbrx7br7ZWCJp61/igJSgGA
         +tsv6wgoQC/y2J9CN7tdfXO22WngAS9iHeg9MbBRNSiZ+KBwrY9sy7hkwgo/wwAUUNG2
         e3qQ4Wf2mcQx5021HwRfXtdtDpYYl5Jc4iyFG4XzC8gw8zRb5Q8QPcax5GttoYnBXFBs
         0SFU0q2tWsRNFTX8EnS9jE5tHlUGiMwX4UpkFvAkHLKTPnG2liBOtI2lFsekPVODoY5F
         GpXg==
X-Forwarded-Encrypted: i=1; AKwUvBy/jjkwFroNy9RAYvl0YV8Fmd4LaPouxNeKqnnyVYCoFQOlmFuzzEuXvpsGCjPgqzgSBwsBo3x8crhs0zuc@lists.infradead.org
X-Gm-Message-State: APuU4Z/Wu2iiFhjiIcfE8e9npw9iK/CXJJmdVRLKSUhS8W04/ypfhW3L
	fIOd+Oj18Eelzz6Ws50sKv3HL2bX4XrR0XpsdvGA/kU7ckzll7Ud+Hf6qcdpuu96ZEs=
X-Gm-Gg: AYBFou0SGkRaPVorDXjMpFrOohrd3FPoS2+an/JPlSQbh5BtSpQzgBUnEHFlelOHnj7
	G9nSXoi6y5lDmJuIv6hwTY5jeiCFX0fxNUo82o3xPABGPaEwQul3majNvkLbsZ9pUB49ol6Im07
	SdKKDzUHz5yD4jkcwwEowyVZZvJkyIsBb6OJDFpAV8uPTaALXQ8+H2vclI9WRWovoj2PM1llFL8
	I5vXz1hJMHRQyMRDi3PSlRw/bFZ+pCUvKYHFvlF78Ih7IQDdi+zhmbqvBuPDcdqih7J4lmHXuph
	5rbhjNLfjzkQEolA3hMu+SNL7Fo/e5Q41kf5lz8TvhKWHs04LP1xkLqVXuds3KS3OlcvIHTNvFq
	4RZXu0EWcuK35e9mZK2/y3hASjpHeO8y+ajRFoKYm55HPAxhkCywA3HTg4fr6085X/WGBasv1na
	w1X9klG5F0YcptSiwNAGwGWtI0K8T9Uy3fJpKV0PWqjxXh8bkykbCN0NE2H7MSoO/Dm20v0bCZ2
	vrxxpmCnf3Q4Lc90PCY5aq6T/zfJ4Naoyacn5rEQue9ZhXJc5H3EqpEHsMuJv0YudeTdrLVloWQ
	H96FTMmpkCzNa8WumiOOaziwZCy2I+52K5MEw5GC2oYJIGPUsUESRQbcL0c57F6SV9tiA3PLVj9
	fQCkQ7GY=
X-Received: by 2002:a05:600c:1914:b0:4a4:7a8d:c436 with SMTP id 5b1f17b1804b1-4b6de788f5bmr33245395e9.11.1793962505296;
        Fri, 06 Nov 2026 02:55:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9df2:2e39:58f0:72ca? ([2a01:e0a:106d:1080:9df2:2e39:58f0:72ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6ed5b8159sm46157125e9.2.2026.11.06.02.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:55:05 -0800 (PST)
Message-ID: <d089bf43-5037-4ed6-93a5-c067ad1483b1@linaro.org>
Date: Fri, 6 Nov 2026 11:55:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 08/10] arm64: dts: amlogic: meson-s4: add the USB host
To: christian.koever-draxl@student.uibk.ac.at, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-9-christian.koever-draxl@student.uibk.ac.at>
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
In-Reply-To: <20261106104659.54656-9-christian.koever-draxl@student.uibk.ac.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_025511_037152_5D3F8B43 
X-CRM114-Status: GOOD (  11.55  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTEvNi8yNiAxMTo0NiwgY2hyaXN0aWFuLmtvZXZlci1kcmF4bEBzdHVkZW50LnVpYmsuYWMu
YXQgd3JvdGU6Cj4gRnJvbTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVy
QG91dGxvb2suZGU+Cj4gCj4gQWRkIHRoZSB0d28gVVNCMiBQSFlzIGFuZCB0aGUgVVNCIGdsdWUg
d2l0aCBpdHMgeEhDSSBob3N0IGNvbnRyb2xsZXIuCj4gVGhlIFM0IGhhcyBubyBVU0IzIFBIWSwg
c28gdGhlIGhvc3QgcnVucyBVU0IyIG9ubHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFu
IFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+Cj4gLS0tCj4gICBhcmNo
L2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaSB8IDQ1ICsrKysrKysrKysrKysr
KysrKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaSBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpCj4gaW5kZXggOGJiZDcwZTUyYTI5
Li4xNTU5OTc2NDlkYzMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2lj
L21lc29uLXM0LmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24t
czQuZHRzaQo+IEBAIC03NzAsNiArNzcwLDI2IEBAIGNwdV90ZW1wOiB0ZW1wZXJhdHVyZS1zZW5z
b3JAMjAwMDAgewo+ICAgCQkJCWFtbG9naWMsc2VjdXJlLW1vbml0b3IgPSA8JnNtIDE+Owo+ICAg
CQkJfTsKPiAgIAo+ICsJCQl1c2IyX3BoeTA6IHBoeUAzYzAwMCB7Cj4gKwkJCQljb21wYXRpYmxl
ID0gImFtbG9naWMsczQtdXNiMi1waHkiOwo+ICsJCQkJcmVnID0gPDB4MCAweDNjMDAwIDB4MCAw
eDIwMDA+Owo+ICsJCQkJY2xvY2tzID0gPCZ4dGFsPjsKPiArCQkJCWNsb2NrLW5hbWVzID0gInh0
YWwiOwo+ICsJCQkJcmVzZXRzID0gPCZyZXNldCBSRVNFVF9VU0JQSFkyMD47Cj4gKwkJCQlyZXNl
dC1uYW1lcyA9ICJwaHkiOwo+ICsJCQkJI3BoeS1jZWxscyA9IDwwPjsKPiArCQkJfTsKPiArCj4g
KwkJCXVzYjJfcGh5MTogcGh5QDNlMDAwIHsKPiArCQkJCWNvbXBhdGlibGUgPSAiYW1sb2dpYyxz
NC11c2IyLXBoeSI7Cj4gKwkJCQlyZWcgPSA8MHgwIDB4M2UwMDAgMHgwIDB4MjAwMD47Cj4gKwkJ
CQljbG9ja3MgPSA8Jnh0YWw+Owo+ICsJCQkJY2xvY2stbmFtZXMgPSAieHRhbCI7Cj4gKwkJCQly
ZXNldHMgPSA8JnJlc2V0IFJFU0VUX1VTQlBIWTIxPjsKPiArCQkJCXJlc2V0LW5hbWVzID0gInBo
eSI7Cj4gKwkJCQkjcGh5LWNlbGxzID0gPDA+Owo+ICsJCQl9Owo+ICsKPiAgIAkJCWV0aF9waHk6
IG1kaW8tbXVsdGlwbGV4ZXJAMjgwMDAgewo+ICAgCQkJCWNvbXBhdGlibGUgPSAiYW1sb2dpYyxn
MTJhLW1kaW8tbXV4IjsKPiAgIAkJCQlyZWcgPSA8MHgwIDB4MjgwMDAgMHgwIDB4YTQ+Owo+IEBA
IC05ODgsNiArMTAwOCwzMSBAQCBtZGlvMDogbWRpbyB7Cj4gICAJCQl9Owo+ICAgCQl9Owo+ICAg
Cj4gKwkJdXNiOiB1c2JAZmUwM2EwMDAgewo+ICsJCQljb21wYXRpYmxlID0gImFtbG9naWMsbWVz
b24tczQtdXNiLWN0cmwiLAo+ICsJCQkJICAgICAiYW1sb2dpYyxtZXNvbi1nMTJhLXVzYi1jdHJs
IjsKPiArCQkJcmVnID0gPDB4MCAweGZlMDNhMDAwIDB4MCAweGEwPjsKPiArCQkJaW50ZXJydXB0
cyA9IDxHSUNfU1BJIDEyOSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiArCQkJI2FkZHJlc3MtY2Vs
bHMgPSA8Mj47Cj4gKwkJCSNzaXplLWNlbGxzID0gPDI+Owo+ICsJCQlyYW5nZXM7Cj4gKwkJCWNs
b2NrcyA9IDwmY2xrY19wZXJpcGhzIENMS0lEX1VTQj47Cj4gKwkJCXJlc2V0cyA9IDwmcmVzZXQg
UkVTRVRfVVNCQ1RSTD47Cj4gKwkJCXBvd2VyLWRvbWFpbnMgPSA8JnB3cmMgUFdSQ19TNF9VU0Jf
Q09NQl9JRD47Cj4gKwkJCWRyX21vZGUgPSAiaG9zdCI7Cj4gKwkJCXBoeXMgPSA8JnVzYjJfcGh5
MD4sIDwmdXNiMl9waHkxPjsKPiArCQkJcGh5LW5hbWVzID0gInVzYjItcGh5MCIsICJ1c2IyLXBo
eTEiOwo+ICsJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICsKPiArCQkJY3JnX3hoY2k6IHVzYkBm
ZGUwMDAwMCB7Cj4gKwkJCQljb21wYXRpYmxlID0gImdlbmVyaWMteGhjaSI7Cj4gKwkJCQlyZWcg
PSA8MHgwIDB4ZmRlMDAwMDAgMHgwIDB4MTAwMDAwPjsKPiArCQkJCWludGVycnVwdHMgPSA8R0lD
X1NQSSAxMzAgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4gKwkJCQljbG9ja3MgPSA8JmNsa2NfcGVy
aXBocyBDTEtJRF9VU0IxX1RPX0REUj47Cj4gKwkJCQlzdGF0dXMgPSAib2theSI7CgpEcm9wIHN0
YXR1cwoKPiArCQkJfTsKPiArCQl9Owo+ICsKPiAgIAkJdWFydF9hOiBzZXJpYWxAZmUwNzgwMDAg
ewo+ICAgCQkJY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uLXM0LXVhcnQiLAo+ICAgCQkJCSAg
ICAgImFtbG9naWMsbWVzb24tYW8tdWFydCI7CgpXaXRoIHRoYXQ6ClJldmlld2VkLWJ5OiBOZWls
IEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KClRoYW5rcywKTmVpbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
