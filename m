Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEACCA9ED0
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Oct 2026 09:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KozkMX73b+QEb8fhZN/MZPMy/nsjaaywOdBM7F0WdzM=; b=lVYuWlOhRwuim7IAxz7vBalyVo
	EZGZnOWiMjBrLBtMlyaNLKsfwBaO1xx5Nhk/fHD3vPmV/e+lzZulyu9E3AWHMzdDQKGvmLjzmZ/Ne
	DhndXWz2D0AFsO8J+mhaNQ+OThVDtuHPkr3cnatGc2AlURnj3PqddHw7UqnqexpBa2S+5m1K2/VRw
	ZvrwLkXRdFnzE3cT5Z75OY2yE9+oJTnhVn3ByTPUnpnBfzjEuuLSsf5KbkQ1YT5jVGSm52FEFXIUG
	DXGNkOW7h3xefjXcppgEbfONFuNfFIxiD/vs6+60seMEz5wZiN0/ixLGQGDYX0d7NtYKHhfa6HTWB
	+SV3QzxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCHx-0000000A3Jp-2VDg;
	Mon, 12 Oct 2026 09:25:45 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCHu-0000000A3Is-46ta
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Oct 2026 09:25:44 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a061a13884so14148855e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2026 02:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791797141; x=1792401941; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lk5ih1jl7s/qnH8PsiY7GfNUNgydrjBFZI1dErLjrRU=;
        b=f/Dpdiko/zd+ypqrFLoOyPi1S2bP4AoVOYf3HCvdieIDuqmk9ngHUItbUQcX1kBhag
         oABl1mXxV/IrTi7naU8pmYAWFqzNqS25OnLfPn9A6sYgUPlwOFDqeQebHwIjk8SmEr9a
         +hN6QlHQAjvIMmvW7mwKT2vGs+0q9rj3nJFD1TQOzJ4E+EIEHLVuMI6lhZptcrCyJcyC
         tFXXHO0EK/ZILlv/8rExu3GwU+nrACyT61tFOZHVfdcTB6pGiEtUe2Pw/RdeQthHYhT6
         BHJrWad+NoixMmiylLcWYoPYw6rOZ8Y75M6imbZfNEJ5twPDYhtQ4vfCPFaXEoMzn3Nd
         b3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797141; x=1792401941;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lk5ih1jl7s/qnH8PsiY7GfNUNgydrjBFZI1dErLjrRU=;
        b=CW7ZJkemKDtRoqxaFBTOTRlpXR3p4bXTnax5+LQcG6Lsac4akBwhLGX6u+SVELhj+/
         cptTJ8XIvNVEri4Izu4gJVNf13VIscresIUCwVEqUqTJDLTDqyvloM72rHCRS/AU/rW6
         l7Q+HKsvcYRaSbAq0wui7L5aiIF8TpjQ4v/Jz+NCqA8ofx0u1RvWMKaKGbGip//dOzPE
         QhbTnXIn7K3xIduwmelWnAR9aqlUs/gxFfmr44kny3gGm60jZqrnGgM6F7GME1cCbT6q
         w28bJhjmBxSf9+9Y8HbLCdzeqYCdRMJi1OGmtBUV1V2dDMiNwxDQOjIwuvXNmRntCo+X
         e2jg==
X-Forwarded-Encrypted: i=1; AKwUvBwfAzDTKCqPhutR0Vb0/L3XuJQykT7EYKgnUAP54vnsNvOV9Qs66l52mqwoOtDUuk9KaNfedHJU0i+BZ0sd@lists.infradead.org
X-Gm-Message-State: AFq9FYJEtXkrbKJ87XdZAGo8oejGMzsymUTZq1LWq3DP15CU/ANva7MB
	iknU8wg5UBxjpgOlsoS+81Ek/fnF9g3KU2ulnwFJj/hxByVN8f/XUF+0I2cblLNnJIY=
X-Gm-Gg: AYBFou2WWa4/HgIGwmVANwtxcf7ccwFr1Iba2NhbAeitE3b5Nl1jUy1ltXPhmfM0wSi
	u64ryH1cyZ6A1MSbNpqzH84g4llJsvkX/niBehH3lTBVXUphqWPSNaWen5512KxsS8pa9XV8j/P
	flV1JiO4Tt37me7UuiB9Y0Bto7pZL3niDRHHyyXF3Uljctz9doRzUS3NEadgwbl1WbX4l+xhAh5
	3e6HiRduaOJuEM1aZxvEQ/jpn1dOsOptCHLtk+0eIVMDlKETMDW28rn/V/BJZ8Z4nmmYwbNRT5Y
	l04mBlHCv6fB6JxjD8LbljWnh6kyfM88nKQMUGQyOunpFP2lfKsv4cMke+85yseW2x9nkOZxUOj
	TkH2AqnfIBwHd2RohpaIvuBftYiZcQbKUeiuaQOl8s1kEbOOGwrw7ng9IP2iEtqpiiHQ+tWclEQ
	fc2KjuaKdRZkoYxLQXj1bbXB3UOiiSNqX5ljy5vr24icRV8BOevNRrzj+g4piHqF8rMRWmOx9Yk
	Y6RzU1eR/5LJtg7Fg4akQkYqpQIyritM9wjwmGsSpZd7bKhLck=
X-Received: by 2002:a05:600c:674a:b0:49f:f0bd:1e40 with SMTP id 5b1f17b1804b1-4a18e4afe9cmr153244585e9.23.1791797140983;
        Mon, 12 Oct 2026 02:25:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:417e:f4c4:5b8:8c48? ([2a01:e0a:106d:1080:417e:f4c4:5b8:8c48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be8c5e7sm345518685e9.4.2026.10.12.02.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:25:40 -0700 (PDT)
Message-ID: <255fe08c-8d58-441d-988c-9145f0995c6f@linaro.org>
Date: Mon, 12 Oct 2026 11:25:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: meson-gxbb-odroidc2: read the Ethernet
 MAC address from eFuse
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 filipp.dunsky@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com>
 <20261011-odroidc2-dts-v2-1-a3a4a752f2ab@gmail.com>
 <CAFBinCAOsJG=ROP43+pj9dqYc4yWXs4RQisRZghqzbtspp=e7A@mail.gmail.com>
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
In-Reply-To: <CAFBinCAOsJG=ROP43+pj9dqYc4yWXs4RQisRZghqzbtspp=e7A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_022543_040889_E1678D0B 
X-CRM114-Status: GOOD (  11.07  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTAvMTEvMjYgMjI6NDksIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4gVGhhbmsgeW91
IGZvciB5b3VyIHBhdGNoIQo+IAo+IE9uIFN1biwgT2N0IDExLCAyMDI2IGF0IDg6MzHigK9QTSBG
aWwgRHVuc2t5IHZpYSBCNCBSZWxheQo+IDxkZXZudWxsK2ZpbGlwcC5kdW5za3kuZ21haWwuY29t
QGtlcm5lbC5vcmc+IHdyb3RlOgo+IFsuLi5dCj4+ICsmZXRoX21hYyB7Cj4+ICsgICAgICAgcmVn
ID0gPDB4MzQgMHg2PjsKPj4gK307Cj4gUXVlc3Rpb24gdG8gTmVpbDogc2hvdWxkIHRoZSBldGhf
bWFjIG5vZGUgYmUgbW92ZWQgZnJvbSBtZXNvbi1neC5kdHNpCj4gdG8gbWVzb24tZ3hiYi1vZHJv
aWRjMi5kdHM/Cj4gT2Ryb2lkLUMyIHdvdWxkIGJlIHRoZSBvbmx5IGJvYXJkIHVzaW5nIGl0IGFu
ZCB1LWJvb3Qgc2VlbXMgdG8gZGVyaXZlCj4gTUFDIGZyb20gU29DIGNoaXAgSUQvc2VyaWFsIG51
bWJlciBpbnN0ZWFkIG9mIHJlYWRpbmcgaXQgZnJvbSBlRnVzZQo+IChzbyBJJ20gbm90IHN1cmUg
YWJvdXQgdGhlIHN0YXR1cyBvZiBNQUMgYWRkcmVzcyBpbiBlRnVzZSBvbiBtb3N0Cj4gYm9hcmRz
KS4KCk9kcm9pZCBDMiBoYXMgYSBjdXN0b20gZWZ1c2UgbWFwcGluZyBzbyBpdCBjYW4ndCBiZSB1
c2VkIG9uIG90aGVyIGJvYXJkcy4KCk5laWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
