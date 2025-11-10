Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C4ACCFA1A
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Nov 2025 06:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olNTHaltA99Kctsn5LWyxujH1+hazIDO5ONYTHRx60k=; b=EmkgMHfXjshm4/li8gZR+/k4Sy
	MhT62lsg22yhu3gtQt8TtgNxtz3nQT02t7X11ZA32NJbtRVoax/hJogcQ3T63YMq4cG3a0f3ObKuM
	JT6Im9OKT963Rbu3tuwiSPapCLlUoQ7hHfZflvb+KJ9Xa7MUZx90Ep3hrFQeEyfg4mlSTfPgnap23
	6ySgQj+Usa6RcYB3xebEnp6wNyK6HRwbAjYDOHHvXRuGOsrLT+Lqr6l5bWCL3DYy0SAgnNbgqQDdz
	Rmz22h8QvLQ46rRjbGiEbNpBaJc+jgO3CTGVVZZg5tU90aXDb/b9mxXzM61psGV7N2rnvB+5/glAr
	rVWZQKgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vILZk-00000004qFw-2fey;
	Mon, 10 Nov 2025 06:40:28 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vILZg-00000004qF7-0OeT
	for linux-amlogic@lists.infradead.org;
	Mon, 10 Nov 2025 06:40:25 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so20233785e9.3
        for <linux-amlogic@lists.infradead.org>; Sun, 09 Nov 2025 22:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762756822; x=1763361622; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JD4y8dFL4Qc3UIMVu1ByWGHKasnWIhJOmctGKB7rHNk=;
        b=yGl7KvVlAvRtN4CEWrhwdir8DTZ12uCadjpuiT6hfh6NYfD8ooQQvgyWfMJJ2J1h/T
         0fjqBLV63O8R10Lhcfegts1zoShy4b2ljc3MVDF2wHHI+G+7GR61s5DbaK/hzwzjOoMM
         zxs9p9VYUaJdi7GXD9FFipgtvEmDdvwPYQEqzOvLtDPTlgQUFLBwC+4XzIGefMJu7Yi0
         Mh4NkqRs8rQRNDNqKPhalM7NxQ6FFSMa/6efLfYB5dHaRU9oey7XljJ6doyXBkZ9gvPs
         nxMbdLAySE8c5Pl3brJuxYS4W/dLhbZeVwTQVjv+xR3YYA8G68AWuur+c7dhGAoXE86t
         cYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762756822; x=1763361622;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JD4y8dFL4Qc3UIMVu1ByWGHKasnWIhJOmctGKB7rHNk=;
        b=wObhuNrMEmtqGOQKnIkCWg4vg4Pc3hWmC1ozAW9HsGko7hTEzE85njauwoTeiIxhTT
         KKJrbbwUHKngVXCeuLG3dgB9ET2exBLL4D2gloffquOwVGxc4fYRyITqwC5Ng5i0fOWJ
         vxR+V4mhOOTb1jlmY3B5JVM1X/9uRIOsppdFIBURfCIdo712JJmTbIIX5ui/JaUupGGz
         tH/xEWW4hoB1D6lJ80pKdpJIglkcZYd6ZiOr467tFTqWn8qTT/PYrDX5lBq0lsZ6jkq9
         YuMScEOqS55Na+n/9GRq/+arwNiwo2vb0Jo4AyQozrOIt/9Wqx/oy67MWDb1DcfdO8SO
         5Yfw==
X-Forwarded-Encrypted: i=1; AJvYcCV5XvqJLCU7rCIuGMdBZVu/KPhVPcm66UEhJ8I831gIyyxj35CgZJcU3qxUDBw7CtTbqmz3lPohPHsrQb25@lists.infradead.org
X-Gm-Message-State: AOJu0Yyjd0cUgP4hjCxbGSjpd9HgE94mpIN3MNb8ehHdor2NeL09x+ij
	udTN71TJ9o0w9kaEN3kzBNUqBKEPq51c8regCXwATzgu5Gwwn0nH1tvHZJFwOVrYKzA=
X-Gm-Gg: ASbGncsffOF4A95hRsmkUfMa0doTFsM9hojVvMrTjgDfeRtofv9fmBMFJwV4Far3NJu
	tDhmqu9bXe0ozxM0bSuLHYZDstAbtRvgKgC3mUkI5Xdo3zDajztNXhsbo+r5lqmTDO/+vK5j/QV
	fEw/OaR6vGIAorxiJTan9PDBTcpG9BUKUe8Qat4R0CePrHm5jj7SiWMCul6pb8W9MupI9sSkPxQ
	UXMhisDzdB3sZeGBRBZbY+1al34vPYG2lfV0r/IO6ijt9xeOfa070Q1nhM3+hFOIfjUM9zPCJjh
	yWajdJqJFU4f0mJYLPYNfvFzjD81b8IdcW78ZX0j8vVVDVJkvwsJPBXbLbQhE/RFbu971lU/Qj4
	4b8OGeh7uJzJeWA5673fDF3ZJTTrASDxudoyL/PZetHNwqsFlXmej4Wob+Jr7Zs/gaRkNY+Itxb
	eV1xp/lbNjyzvjIu/Yg2VbyIfvSqftVMkXa/2lOqV46ZCYL0aF/i9mDKNjSBd1vRM=
X-Google-Smtp-Source: AGHT+IGOz9+9CDJ3QnsnAcx96wfbo8Uh+Kija8Qn/BBtDb3lYcNFsN3pjUBwX1/h1H29lxDD/6wJ8A==
X-Received: by 2002:a05:600c:4448:b0:46e:206a:78cc with SMTP id 5b1f17b1804b1-47773290517mr61287685e9.28.1762756821769;
        Sun, 09 Nov 2025 22:40:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:f168:a23e:c1b2:ae61? ([2a01:e0a:3d9:2080:f168:a23e:c1b2:ae61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47763b5714dsm111549355e9.0.2025.11.09.22.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 22:40:21 -0800 (PST)
Message-ID: <b341a3b3-c215-4335-a962-799a64a3c1b7@linaro.org>
Date: Mon, 10 Nov 2025 07:40:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND 1/3] dt-bindings: PCI: amlogic: Fix the register
 name of the DBI region
To: Manivannan Sadhasivam <mani@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Yue Wang <yue.wang@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Murray <amurray@thegoodpenguin.co.uk>,
 Jingoo Han <jingoohan1@gmail.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
 <20251101-pci-meson-fix-v1-1-c50dcc56ed6a@oss.qualcomm.com>
 <31271df3-73e1-4eea-9bba-9e5b3bf85409@linaro.org>
 <rguwscxck7vel3hjdd2hlkypzdbwdvafdryxtz5benweduh4eg@sny4rr2nx5aq>
 <20251106-positive-attractive-tiger-ec9c1c@kuoka>
 <lsue7hlgybqpru3qfetlpee2mswnycvhxjffwyxtplmpqved2u@aohtwjtxesr4>
 <65hstqcfcca7xj3cdtq7iikcdojbltfu42zlfdelskakesu3cd@hl3kydp6dw2t>
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
In-Reply-To: <65hstqcfcca7xj3cdtq7iikcdojbltfu42zlfdelskakesu3cd@hl3kydp6dw2t>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_224024_264917_58749437 
X-CRM114-Status: GOOD (  11.34  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 11/8/25 11:40, Manivannan Sadhasivam wrote:
> On Thu, Nov 06, 2025 at 02:37:17PM +0530, Manivannan Sadhasivam wrote:
>> On Thu, Nov 06, 2025 at 09:30:15AM +0100, Krzysztof Kozlowski wrote:
>>> On Mon, Nov 03, 2025 at 03:42:58PM +0530, Manivannan Sadhasivam wrote:
>>>> On Mon, Nov 03, 2025 at 10:47:36AM +0100, Neil Armstrong wrote:
>>>>> Hi Mani,
>>>>>
>>>>> On 11/1/25 05:29, Manivannan Sadhasivam wrote:
>>>>>> Binding incorrectly specifies the 'DBI' region as 'ELBI'. DBI is a must
>>>>>> have region for DWC controllers as it has the Root Port and controller
>>>>>> specific registers, while ELBI has optional registers.
>>>>>>
>>>>>> Hence, fix the binding. Though this is an ABI break, this change is needed
>>>>>> to accurately describe the PCI memory map.
>>>>>
>>>>> Not fan of this ABI break, the current bindings should be marked as deprecated instead.
>>>>>
>>>>
>>>> Fair enough. Will make it as deprecated.
>>>
>>> The true question is what value was being passed as that item (ELBI)?
>>> Because if this was always DBI - device has DBI there - then what
>>> deprecation would change?
>>
>> Nothing, except not breaking old DTs with the binding check. That's why I
>> decided to remove it in the first place.
>>
> 
> Neil, do you still insist on marking the 'elbi' region deprecated than removing
> it?

Not really. if the original definition was wrong, let's fix it.

Neil

> 
> - Mani
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
