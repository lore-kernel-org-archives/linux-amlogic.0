Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B40FC3ABC9
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 May 2025 10:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M3RtwBgu/C6H62aoL0vjiJVPIrdBBKOoxTgvYcMZalg=; b=M2fgCVO5JjXanp
	kc9nd1GrOk7xJAydrgst/FbbHkYXwGKHnOQG/a3J5SXQ8jDqg0Dcg6HKJES5AkZ196dD00DMzqjE5
	ViOFRn9yKEprpxM1J3M1qC83RC/fWpavkj83pPj0vOFTftX59xmw4REZ/m1t7ugpWpSkv0SHb63X3
	UzAVIZsV6iAM471C5+gaSToOKwJIUAvtCrPDvIYNZ0zm7hfZgAv6Y0hxfdlbktAiEDY5DVRSailCx
	+TW7Hl2PXkdALnpieWQYjc25ksk2och5qTqfIJt42l3iVMHHcnrg4NA30PumJD+UFXuOqHx0L1Jsp
	JgQgwI0AxTb83PTWdm/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmjI-0000000C4Xd-07My;
	Tue, 13 May 2025 10:19:20 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmcS-0000000C2rD-2u6U
	for linux-amlogic@lists.infradead.org;
	Tue, 13 May 2025 10:12:18 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-442ed8a275fso2859635e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 13 May 2025 03:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131135; x=1747735935; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JJeqmvQf3UAL4kCovc4gGHXLVQH6Y8/QOMAb9LY1twk=;
        b=nbu0V2apurhO1P+o/o9/VKmZ1KxqDfJhhr8b6pSuPETpVt7YnG8wZMNxUU4aq3mzN6
         lLvnbqwkXR7SLodXcPAyFUr/H9NSJ8EGWwTd39tb6d8TVKaxjl0ovw4t+x9lUGMFxAPX
         HkTNNDM0F9W8GD8dpRilv15B4+shuFLl6tFDhHaMu+1Wh7+3rhr3VAA+Aioorp/ceP+h
         VZDvXcqqCAGwmhDtLtvW6xOLU8jKYMdsaX0Zxt+whDDUsaifpXYRAhxdN5zMjehmgK5K
         4KQ5jn5630V9cUTGWHAVhH24U7tB8He/kqDNw2ByF2M09fi94V2dQgkN7iHWWMiTXygi
         XkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131135; x=1747735935;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JJeqmvQf3UAL4kCovc4gGHXLVQH6Y8/QOMAb9LY1twk=;
        b=EZ0e31xTxsKdqxc7dm4PZhzkPIOtrXm+GEPcTwrS7e0wtHYeIfMiCiOOI/O730bKXj
         tsUK+b9rJzc+q09XFF+tEKZBr6WkWXDwMsWWeNxGCLcXwh/IcP0s/mdUilSqKFjCNv3A
         22g2O/TyD1Gp5atZHZXfekRbkkYcol0euhwUv8drWyBgg8ZXHEP2AE+fpLUdVf977yc3
         tCSvk3YafcsuHySyyB9KmAdHzbyOSzuUQySMIv62MDZkwecFwi09sW+LpjFt5IWxt11q
         X4yuuo+wy3WCc+84uNGf0IDNPGIjgeeqJLyjHYsw3qrXeAObOZgPjoq/eS2+7xj3TZ3h
         gh0w==
X-Gm-Message-State: AOJu0YzphOe3c9Gk/ybEf9hnpUF9pUhWjlB/34WNCCCLjbbVntcDhcs6
	E/kwF65tAIlBMlfMViMi13p3hUxKrC8VDkS8Lg0H/vrUYRN6CM3XOo6SZ2DGVds=
X-Gm-Gg: ASbGncvZ9df4c46OcDpZQ2f34lF6YdUoSdCMT9nS1Vm6WkIUxkGphJJ7zkUmamY38FY
	nKBUL4COU/hcIMXN/hvMnOQYq1yULU2+4BQInz5wTALCzA+MI4Cjf+XjYGiA3XwwPZf9GafNo8D
	2g/WA2YAQNUl70g0mlR0bpanPZmTPnPsa5/elMJKjVLgBpZAcPd26UCc3vE9b7b8mBRRocxQxIJ
	htH+pCMhS4uaEV/+OacDSB/jhfUF4dvme2oR9P+X9qAgBF9jEfgEMyffHcjzzmHo9auBWQIQVx8
	dMXdqlnrb4Oh/Q9wz+N0RmdJSa9MvwSJgw2ZcRPaOWe8xU/aWZrhyQ3wMFcgCz+ywslXkNR0lGI
	ktRJ6ImCiTi+r
X-Google-Smtp-Source: AGHT+IGkA3sY3L4MfFT9frruBvb5if6+w/Gw4kde8Il5ntffLfGLugxuM3zv1UQFvt6KFoEpgM+QbQ==
X-Received: by 2002:a05:600c:4e90:b0:442:e147:bea7 with SMTP id 5b1f17b1804b1-442e17571eemr76287125e9.29.1747131134966;
        Tue, 13 May 2025 03:12:14 -0700 (PDT)
Received: from [10.61.1.139] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3aeb6esm207550715e9.25.2025.05.13.03.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:12:14 -0700 (PDT)
Message-ID: <838c5305-5c5b-4232-b7fe-86598dc50ace@linaro.org>
Date: Tue, 13 May 2025 12:12:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM DT updates for v6.16
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_031216_732063_CB1DC542 
X-CRM114-Status: UNSURE (   8.44  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksCgpIZXJlJ3MgQVJNIER0IGNoYW5nZXMgZm9yIEFtbG9naWMgU29Dcywgc2V0dGluZyBwdWxs
LXVwIGZvciBVQVJUIFJYL1RYIGxpbmVzIGJ5CmRlZmF1bHQgZm9yIGF2b2lkIGlzc3VlcyB3aXRo
IGRlYnVnIGNvbm5lY3RvcnMsIGFuZCBpbnRyb2R1Y2luZyB0aGUgTWVzb244IGJhc2VkClRDVSBG
ZXJuc2VoZmVlIDMuMCBib2FyZC4KClRoYW5rcywKTmVpbAoKVGhlIGZvbGxvd2luZyBjaGFuZ2Vz
IHNpbmNlIGNvbW1pdCAwYWYyZjZiZTFiNDI4MTM4NWI2MThjYjg2YWQ5NDZlZGVkMDg5YWM4OgoK
ICAgTGludXggNi4xNS1yYzEgKDIwMjUtMDQtMDYgMTM6MTE6MzMgLTA3MDApCgphcmUgYXZhaWxh
YmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2FtbG9naWMvbGludXguZ2l0IHRhZ3MvYW1sb2dpYy1h
cm0tZHQtZm9yLXY2LjE2Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gMmMxODc5YTQ0
MDMxNWUwYjI5MmJiZmYwZmE2M2E3M2JkOGE1MmUzNDoKCiAgIEFSTTogZHRzOiBhbWxvZ2ljOiBt
ZXNvbjgtZmVybnNlaGZlZTM6IERlc2NyaWJlIHJlZ3VsYXRvcnMgKDIwMjUtMDUtMDkgMTc6Mzc6
MDUgKzAyMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCkFtbG9naWMgQVJNIERUIGZvciB2Ni4xNjoKLSBVQVJUIFJYL1RY
IHB1bGwtdXAgcGluY29uZiBwcm9wZXJ0aWVzIGZvciBhbGwgU29DcwotIE5ldyBCb2FyZHM6CiAg
IC0gTWVzb244IFRDVSBGZXJuc2VoZmVlIDMuMAoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpKLiBOZXVzY2jDpGZlciAoNCk6
CiAgICAgICBkdC1iaW5kaW5nczogdmVuZG9yLXByZWZpeGVzOiBBZGQgVEMgVW50ZXJoYWx0dW5n
c2VsZWt0cm9uaWsgQUcKICAgICAgIGR0LWJpbmRpbmdzOiBhcm06IGFtbG9naWM6IEFkZCBUQ1Ug
RmVybnNlaGZlZSAzLjAgYm9hcmQKICAgICAgIEFSTTogZHRzOiBhbWxvZ2ljOiBBZGQgVENVIEZl
cm5zZWhmZWUgMy4wCiAgICAgICBBUk06IGR0czogYW1sb2dpYzogbWVzb244LWZlcm5zZWhmZWUz
OiBEZXNjcmliZSByZWd1bGF0b3JzCgpNYXJ0aW4gQmx1bWVuc3RpbmdsICgyKToKICAgICAgIEFS
TTogZHRzOiBhbWxvZ2ljOiBtZXNvbjg6IGVuYWJsZSBVQVJUIFJYIGFuZCBUWCBwdWxsIHVwIGJ5
IGRlZmF1bHQKICAgICAgIEFSTTogZHRzOiBhbWxvZ2ljOiBtZXNvbjhiOiBlbmFibGUgVUFSVCBS
WCBhbmQgVFggcHVsbCB1cCBieSBkZWZhdWx0CgogIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vYW1sb2dpYy55YW1sIHwgICAxICsKICAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy92ZW5kb3ItcHJlZml4ZXMueWFtbCAgICAgICB8ICAgMiArCiAgYXJjaC9hcm0vYm9vdC9kdHMv
YW1sb2dpYy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgIDEgKwogIGFyY2gvYXJtL2Jvb3Qv
ZHRzL2FtbG9naWMvbWVzb244LWZlcm5zZWhmZWUzLmR0cyAgIHwgMzA2ICsrKysrKysrKysrKysr
KysrKysrKwogIGFyY2gvYXJtL2Jvb3QvZHRzL2FtbG9naWMvbWVzb244LmR0c2kgICAgICAgICAg
ICAgIHwgIDIyICstCiAgYXJjaC9hcm0vYm9vdC9kdHMvYW1sb2dpYy9tZXNvbjhiLmR0c2kgICAg
ICAgICAgICAgfCAgIDQgKy0KICA2IGZpbGVzIGNoYW5nZWQsIDMzMiBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQogIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9ib290L2R0cy9hbWxv
Z2ljL21lc29uOC1mZXJuc2VoZmVlMy5kdHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
