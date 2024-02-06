Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F91C4829F
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 11:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YF6XYZOot41qr7bevaWn9tkjk9Y2Yyyj9GKfPhNcxqM=; b=RvIVAI/ev+Jz3Zm5taqRHBfCjZ
	53ePUolcY6b8Lo+z1cGr9TVjdHe3kgf+noUJC7Y3dtF9pFqGZcOUH2KBfHOv4EBNyIkUEUWerIxTf
	ixBBbCIdOEYO5HuforsK7tlftAIaSti6YHBhFSarhMAD88EU62XtJW//Jy1hKHDfySnPaU5PJBTeP
	Jw9fHDiB5EwMuyQeoQTxyvbo2ATRWH0JSmL/AtSP2GTZnw3tRn4qYOo+Gx6n7ridfYOBMg2FuvUrX
	wwDye46mT22D24qJCZ6yaKrgPLeA3iJvqH/LFAkLEYEoJn9b5bYYVpK6xEmgTTcaspwpHs4eyjHXY
	sEwYJL2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXJQa-00000007G7v-0VxK;
	Tue, 06 Feb 2024 11:15:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHJU-00000006Zge-0aKe
	for linux-amlogic@bombadil.infradead.org;
	Tue, 06 Feb 2024 09:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=qDA/c0GB/jdNWETef5L0VlQycCa3Yy8UHzYwG7wQK70=; b=N7nFdlbv9AQTVKShIClZoDyTzA
	8yWWQkbXkZp3OnxuihYsICk0esLgGXoYxU/ymHq1rn4xrXx8PTiM5/INHAvfA+nRaXS9clmnRvx3Q
	PI/eNYTFeqYs5r0T1lDyyAuYRdbYuEyFbzJ4fB8cdpY6+Ft+ZFmx16AxyKwOUS4w8t6thBiJ+5qVH
	2zUJ593BpD1857ZrcqMtC857QF8Z1+hMZfo+3VplIPmwx9QkbpHxAEYTSFAh1FwAIXJJtbJTZQtpQ
	nq+uC25ROyPaww7rZWcmOmszNci3liR9gYwkSgvLA50muaPFYqD5XFiJ/OUWQsCKBT9W2xznlRlOl
	g2G2Nk3g==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHJK-0000000COw5-0pnI
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Feb 2024 09:00:17 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-33b130f605eso3467789f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Feb 2024 01:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707210007; x=1707814807; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDA/c0GB/jdNWETef5L0VlQycCa3Yy8UHzYwG7wQK70=;
        b=fyd07CN/YcVKE5ciA+8c+KGJmpk1WSbbtVeqtYqGW693dhx7z8aiZ2FGl3oGWdTHEA
         pn3qbnMNfloe0sp7Vrh1fO9fH7G9T9hBSAG3j8ObKwA1QG6WEiuP3Ynjy2HOWpzl3Uac
         L+eUcoZR0TTjy6XzqmAFLXrpnZMPqHekPc4QC6bsjmNueKGQkVU+g6DkfE3a1466K4z7
         1uLVU+27vOyLX90SB2Ug+aYR+MIYROdnmOILijBeH38rKB4OF9SN8T6ZprtdQ5jU25Zt
         sSmgdRgc7dr1O/j4IWdo+seaElJn+ZmciO4Z1r3GFvjz2Gq7aF4TOIvPLNOhj8w98Gjj
         9Ckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707210007; x=1707814807;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qDA/c0GB/jdNWETef5L0VlQycCa3Yy8UHzYwG7wQK70=;
        b=lKS/SjP9aR4NpGBkSi+uPy6vSDBApZCbWkIarhlkgHTVIe9WEqGc7++/Pj6nCcfSbf
         YZZT5r57ccG2EMScoi9XifNWme5xyc4iJE25D1vDcPCw7o7lMYS3YLgDC8zllDGmYE0D
         taItB7XpSc5mu+jbyTRhPx4at6yS6L/TUMKxxe3beJBa9Mo0hKgqCuc8neE9y5LAzQyH
         A3oclkDJpYyzfC+Dt4dB7aY4OzxPkAlI3Fydw5n6nc+KPwXU5GnYzIrQnEPojVLjpOC0
         KHQ37paaTRVBblFDknv0BQqBaWuW1TVsrQz3SSX1n/eZQSwbbvPd586Bi6rzRv71n/a5
         pfiA==
X-Gm-Message-State: AOJu0YzUiCAdq3eBA/w/tpTDfCrnrfcqodUi7UhinfL2QbkvzO+RhsgR
	EMlzRkeGwnayADgk1WHMV3dgpLsE6htQmHBUGypRAD1Ot++ozAUxdm5RwekZBtY=
X-Google-Smtp-Source: AGHT+IHqUCzXiZ92tM5ElUPeDFh/QSLJkor5uHIT/8y6w7/Jygp5VuISiRs526LTY2GRXOhzVt5Vjw==
X-Received: by 2002:a05:6000:11c7:b0:336:6a76:40cd with SMTP id i7-20020a05600011c700b003366a7640cdmr671376wrx.62.1707210006793;
        Tue, 06 Feb 2024 01:00:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUdRnH6cUHjQXQoS9ElKgXTzO05+dvNgzt+0WhToP1pzwBZGlGik+t7zOpL2tmY8wk15cOXta1sIKcTs5uIdxm6Kwx1xQ1nbMuXLfhMNwIhi7BksXBvDhm/pAZg6q0LJKBYp9UEVZnryQIHFJOLiaaAcb0WueT1NE2xvMSEy1dG4kbqEAg9ig25tJEziWm3m/1hySTr759JCUJW4cJ1xmnSOxmQq1nvkdCF6TdqsFB9aQNOp+p5L3sGKxezskvX3qvbalN47b+ilmLBtvl+YFti3nxvJeEpHdPnl/MGd+1p45Y347nZ7XeftyPq4oajVyVYfOp+UEmchG8u+T1cthveZwHUwNCoxzYBxhIN0a7JNG0eEPiJkEavTKCXpUiUT0ejFt/0poeZdaza9egnApOE/Q==
Received: from ?IPV6:2a01:e0a:982:cbb0:ba23:8574:fa8:28dd? ([2a01:e0a:982:cbb0:ba23:8574:fa8:28dd])
        by smtp.gmail.com with ESMTPSA id g14-20020a05600c4ece00b0040fe4b733f4sm930244wmq.26.2024.02.06.01.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 01:00:06 -0800 (PST)
Message-ID: <cf47b82c-6307-475b-af3a-eab7f09715f0@linaro.org>
Date: Tue, 6 Feb 2024 10:00:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCHv1 4/5] arm64: dts: amlogic: Add cache information to the
 Amlogic S922X SoC
Content-Language: en-US, fr
To: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240205171930.968-1-linux.amoon@gmail.com>
 <20240205171930.968-5-linux.amoon@gmail.com>
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
Organization: Linaro Developer Services
In-Reply-To: <20240205171930.968-5-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_090012_156211_06175D1E 
X-CRM114-Status: GOOD (  12.36  )
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

T24gMDUvMDIvMjAyNCAxODoxOSwgQW5hbmQgTW9vbiB3cm90ZToKPiBBcyBwZXIgUzkyMlggZGF0
YXNoZWV0IGFkZCBtaXNzaW5nIGNhY2hlIGluZm9ybWF0aW9uIHRvIHRoZSBBbWxvZ2ljCj4gUzky
MlggU29DLgo+IAo+IC0gRWFjaCBDb3J0ZXgtQTUzIGNvcmUgaGFzIDMyIEtCIG9mIGluc3RydWN0
aW9uIGNhY2hlIGFuZAo+IAkzMiBLQiBvZiBMMSBkYXRhIGNhY2hlIGF2YWlsYWJsZS4KPiAtIEVh
Y2ggQ29ydGV4LUE3MyBjb3JlIGhhcyA2NCBLQiBvZiBMMSBpbnN0cnVjdGlvbiBjYWNoZSBhbmQK
PiAJNjQgS0Igb2YgTDEgZGF0YSBjYWNoZSBhdmFpbGFibGUuCj4gLSBUaGUgbGl0dGxlIChBNTMp
IGNsdXN0ZXIgaGFzIDUxMiBLQiBvZiB1bmlmaWVkIEwyIGNhY2hlIGF2YWlsYWJsZS4KPiAtIFRo
ZSBiaWcgKEE3MykgY2x1c3RlciBoYXMgMSBNQiBvZiB1bmlmaWVkIEwyIGNhY2hlIGF2YWlsYWJs
ZS4KCkRhdGFzaGVldCBzYXlzOgpUaGUgcXVhZCBjb3JlIENvcnRleOKEoi1BNzMgcHJvY2Vzc29y
IGlzIHBhaXJlZCB3aXRoIEE1MyBwcm9jZXNzb3IgaW4gYSBiaWcuTGl0dGxlIGNvbmZpZ3VyYXRp
b24sIHdpdGggZWFjaApjb3JlIGhhcyBMMSBpbnN0cnVjdGlvbiBhbmQgZGF0YSBjaGFjaGVzLCB0
b2dldGhlciB3aXRoIGEgc2luZ2xlIHNoYXJlZCBMMiB1bmlmaWVkIGNhY2hlIHdpdGggQTUzCgpB
bmQgdGhlcmUncyBubyBpbmRpY2F0aW9uIG9mIHRoZSBMMSBvciBMMiBjYWNoZSBzaXplcy4KCk5l
aWwKCj4gCj4gVG8gaW1wcm92ZSBzeXN0ZW0gcGVyZm9ybWFuY2UuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQW5hbmQgTW9vbiA8bGludXguYW1vb25AZ21haWwuY29tPgo+IC0tLQo+IFswXSBodHRwczov
L2RuLm9kcm9pZC5jb20vUzkyMlgvT0RST0lELU4yL0RhdGFzaGVldC9TOTIyWF9QdWJsaWNfRGF0
YXNoZWV0X1YwLjIucGRmCj4gWzFdIGh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL0FSTV9D
b3J0ZXgtQTczCj4gWzJdIGh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL0FSTV9Db3J0ZXgt
QTUzCj4gLS0tCj4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYi5kdHNp
IHwgNjIgKysrKysrKysrKysrKysrKysrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNTUgaW5zZXJ0
aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL21lc29uLWcxMmIuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dp
Yy9tZXNvbi1nMTJiLmR0c2kKPiBpbmRleCA4NmU2Y2ViMzFkNWUuLjYyNGM2ZmQ3NjNhYyAxMDA2
NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYi5kdHNpCj4g
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmIuZHRzaQo+IEBAIC00
OSw3ICs0OSwxMyBAQCBjcHUwOiBjcHVAMCB7Cj4gICAJCQlyZWcgPSA8MHgwIDB4MD47Cj4gICAJ
CQllbmFibGUtbWV0aG9kID0gInBzY2kiOwo+ICAgCQkJY2FwYWNpdHktZG1pcHMtbWh6ID0gPDU5
Mj47Cj4gLQkJCW5leHQtbGV2ZWwtY2FjaGUgPSA8JmwyPjsKPiArCQkJZC1jYWNoZS1saW5lLXNp
emUgPSA8MzI+Owo+ICsJCQlkLWNhY2hlLXNpemUgPSA8MHg4MDAwPjsKPiArCQkJZC1jYWNoZS1z
ZXRzID0gPDMyPjsKPiArCQkJaS1jYWNoZS1saW5lLXNpemUgPSA8MzI+Owo+ICsJCQlpLWNhY2hl
LXNpemUgPSA8MHg4MDAwPjsKPiArCQkJaS1jYWNoZS1zZXRzID0gPDMyPjsKPiArCQkJbmV4dC1s
ZXZlbC1jYWNoZSA9IDwmbDJfY2FjaGVfbD47Cj4gICAJCQkjY29vbGluZy1jZWxscyA9IDwyPjsK
PiAgIAkJfTsKPiAgIAo+IEBAIC01OSw3ICs2NSwxMyBAQCBjcHUxOiBjcHVAMSB7Cj4gICAJCQly
ZWcgPSA8MHgwIDB4MT47Cj4gICAJCQllbmFibGUtbWV0aG9kID0gInBzY2kiOwo+ICAgCQkJY2Fw
YWNpdHktZG1pcHMtbWh6ID0gPDU5Mj47Cj4gLQkJCW5leHQtbGV2ZWwtY2FjaGUgPSA8JmwyPjsK
PiArCQkJZC1jYWNoZS1saW5lLXNpemUgPSA8MzI+Owo+ICsJCQlkLWNhY2hlLXNpemUgPSA8MHg4
MDAwPjsKPiArCQkJZC1jYWNoZS1zZXRzID0gPDMyPjsKPiArCQkJaS1jYWNoZS1saW5lLXNpemUg
PSA8MzI+Owo+ICsJCQlpLWNhY2hlLXNpemUgPSA8MHg4MDAwPjsKPiArCQkJaS1jYWNoZS1zZXRz
ID0gPDMyPjsKPiArCQkJbmV4dC1sZXZlbC1jYWNoZSA9IDwmbDJfY2FjaGVfbD47Cj4gICAJCQkj
Y29vbGluZy1jZWxscyA9IDwyPjsKPiAgIAkJfTsKPiAgIAo+IEBAIC02OSw3ICs4MSwxMyBAQCBj
cHUxMDA6IGNwdUAxMDAgewo+ICAgCQkJcmVnID0gPDB4MCAweDEwMD47Cj4gICAJCQllbmFibGUt
bWV0aG9kID0gInBzY2kiOwo+ICAgCQkJY2FwYWNpdHktZG1pcHMtbWh6ID0gPDEwMjQ+Owo+IC0J
CQluZXh0LWxldmVsLWNhY2hlID0gPCZsMj47Cj4gKwkJCWQtY2FjaGUtbGluZS1zaXplID0gPDY0
PjsKPiArCQkJZC1jYWNoZS1zaXplID0gPDB4MTAwMDA+Owo+ICsJCQlkLWNhY2hlLXNldHMgPSA8
NjQ+Owo+ICsJCQlpLWNhY2hlLWxpbmUtc2l6ZSA9IDw2ND47Cj4gKwkJCWktY2FjaGUtc2l6ZSA9
IDwweDEwMDAwPjsKPiArCQkJaS1jYWNoZS1zZXRzID0gPDY0PjsKPiArCQkJbmV4dC1sZXZlbC1j
YWNoZSA9IDwmbDJfY2FjaGVfYj47Cj4gICAJCQkjY29vbGluZy1jZWxscyA9IDwyPjsKPiAgIAkJ
fTsKPiAgIAo+IEBAIC03OSw3ICs5NywxMyBAQCBjcHUxMDE6IGNwdUAxMDEgewo+ICAgCQkJcmVn
ID0gPDB4MCAweDEwMT47Cj4gICAJCQllbmFibGUtbWV0aG9kID0gInBzY2kiOwo+ICAgCQkJY2Fw
YWNpdHktZG1pcHMtbWh6ID0gPDEwMjQ+Owo+IC0JCQluZXh0LWxldmVsLWNhY2hlID0gPCZsMj47
Cj4gKwkJCWQtY2FjaGUtbGluZS1zaXplID0gPDY0PjsKPiArCQkJZC1jYWNoZS1zaXplID0gPDB4
MTAwMDA+Owo+ICsJCQlkLWNhY2hlLXNldHMgPSA8NjQ+Owo+ICsJCQlpLWNhY2hlLWxpbmUtc2l6
ZSA9IDw2ND47Cj4gKwkJCWktY2FjaGUtc2l6ZSA9IDwweDEwMDAwPjsKPiArCQkJaS1jYWNoZS1z
ZXRzID0gPDY0PjsKPiArCQkJbmV4dC1sZXZlbC1jYWNoZSA9IDwmbDJfY2FjaGVfYj47Cj4gICAJ
CQkjY29vbGluZy1jZWxscyA9IDwyPjsKPiAgIAkJfTsKPiAgIAo+IEBAIC04OSw3ICsxMTMsMTMg
QEAgY3B1MTAyOiBjcHVAMTAyIHsKPiAgIAkJCXJlZyA9IDwweDAgMHgxMDI+Owo+ICAgCQkJZW5h
YmxlLW1ldGhvZCA9ICJwc2NpIjsKPiAgIAkJCWNhcGFjaXR5LWRtaXBzLW1oeiA9IDwxMDI0PjsK
PiAtCQkJbmV4dC1sZXZlbC1jYWNoZSA9IDwmbDI+Owo+ICsJCQlkLWNhY2hlLWxpbmUtc2l6ZSA9
IDw2ND47Cj4gKwkJCWQtY2FjaGUtc2l6ZSA9IDwweDEwMDAwPjsKPiArCQkJZC1jYWNoZS1zZXRz
ID0gPDY0PjsKPiArCQkJaS1jYWNoZS1saW5lLXNpemUgPSA8NjQ+Owo+ICsJCQlpLWNhY2hlLXNp
emUgPSA8MHgxMDAwMD47Cj4gKwkJCWktY2FjaGUtc2V0cyA9IDw2ND47Cj4gKwkJCW5leHQtbGV2
ZWwtY2FjaGUgPSA8JmwyX2NhY2hlX2I+Owo+ICAgCQkJI2Nvb2xpbmctY2VsbHMgPSA8Mj47Cj4g
ICAJCX07Cj4gICAKPiBAQCAtOTksMTQgKzEyOSwzMiBAQCBjcHUxMDM6IGNwdUAxMDMgewo+ICAg
CQkJcmVnID0gPDB4MCAweDEwMz47Cj4gICAJCQllbmFibGUtbWV0aG9kID0gInBzY2kiOwo+ICAg
CQkJY2FwYWNpdHktZG1pcHMtbWh6ID0gPDEwMjQ+Owo+IC0JCQluZXh0LWxldmVsLWNhY2hlID0g
PCZsMj47Cj4gKwkJCWQtY2FjaGUtbGluZS1zaXplID0gPDY0PjsKPiArCQkJZC1jYWNoZS1zaXpl
ID0gPDB4MTAwMDA+Owo+ICsJCQlkLWNhY2hlLXNldHMgPSA8NjQ+Owo+ICsJCQlpLWNhY2hlLWxp
bmUtc2l6ZSA9IDw2ND47Cj4gKwkJCWktY2FjaGUtc2l6ZSA9IDwweDEwMDAwPjsKPiArCQkJaS1j
YWNoZS1zZXRzID0gPDY0PjsKPiArCQkJbmV4dC1sZXZlbC1jYWNoZSA9IDwmbDJfY2FjaGVfYj47
Cj4gICAJCQkjY29vbGluZy1jZWxscyA9IDwyPjsKPiAgIAkJfTsKPiAgIAo+IC0JCWwyOiBsMi1j
YWNoZTAgewo+ICsJCWwyX2NhY2hlX2w6IGwyLWNhY2hlLWNsdXN0ZXIwIHsKPiAgIAkJCWNvbXBh
dGlibGUgPSAiY2FjaGUiOwo+ICAgCQkJY2FjaGUtbGV2ZWwgPSA8Mj47Cj4gICAJCQljYWNoZS11
bmlmaWVkOwo+ICsJCQljYWNoZS1zaXplID0gPDB4ODAwMDA+Owo+ICsJCQljYWNoZS1saW5lLXNp
emUgPSA8NjQ+Owo+ICsJCQljYWNoZS1zZXRzID0gPDUxMj47Cj4gKwkJfTsKPiArCj4gKwkJbDJf
Y2FjaGVfYjogbDItY2FjaGUtY2x1c3RlcjEgewo+ICsJCQljb21wYXRpYmxlID0gImNhY2hlIjsK
PiArCQkJY2FjaGUtbGV2ZWwgPSA8Mj47Cj4gKwkJCWNhY2hlLXVuaWZpZWQ7Cj4gKwkJCWNhY2hl
LXNpemUgPSA8MHgxMDAwMDA+Owo+ICsJCQljYWNoZS1saW5lLXNpemUgPSA8NjQ+Owo+ICsJCQlj
YWNoZS1zZXRzID0gPDUxMj47Cj4gICAJCX07Cj4gICAJfTsKPiAgIH07CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
