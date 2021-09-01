Return-Path: <SRS0=PfKa=NX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BEBCC432BE
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Sep 2021 07:22:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64D7760F92
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Sep 2021 07:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 64D7760F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:MIME-Version:
	Date:Message-ID:From:Cc:To:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MLUDW7Edv+XssoqXuFQVg4ZOPfElPDQpW/tPBR9/pHs=; b=dOUoxUtcg3a7pz
	6ED3F+qaSCvkvqaSnsfM3+M1oKP1/ifS78QbuYXQlwonlmKMetRiBfEOV6Hf9tjaLX2JCycfGB9OE
	Zv0loaegOKEU8qXJH+HUWZgZL5kJFfsmjO7k5bjoJzoEuZFabdRS5aw3WJ54qNCwkBRhwryo7MdRH
	mECKG/enzlW3UCg03rBsu2eqcOoPssQDe9B4Y+L+DwySySGVkxXvhcgTaGIAMbr84/DuS9DlcRSo4
	kP0+gy6WmcukM2fHPz4uEuTOo50p3t+ADbbUQvn/7/6iWY2FawNtGIu0wmp2gzfMdLeSnHHy5L0zB
	i/fagZ1WBiwdm/VRuKVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLKZj-004JpA-NT; Wed, 01 Sep 2021 07:22:23 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLKZe-004Jna-FP
 for linux-amlogic@lists.infradead.org; Wed, 01 Sep 2021 07:22:22 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20210901072214euoutp01ff2e2a8799243c0c19090400c4ffda84~gocVbFv-p2755727557euoutp01T
 for <linux-amlogic@lists.infradead.org>; Wed,  1 Sep 2021 07:22:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20210901072214euoutp01ff2e2a8799243c0c19090400c4ffda84~gocVbFv-p2755727557euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1630480934;
 bh=ryqrHQmQcbbdSKaFCDai31okoTqu1dRnNF5WAQkVKk8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=o6mT9Aswu9tmZ2ZUz0vXCX05qBwaYTqEL/wKzPCesL/z8GiSzz0qnrDJCkTQyRTnh
 Mm98SUJZ0eqiSPjHbJ7mgLmvyHa6PSRsMEqyHrjozGdAt2iHPcvAEhewmySexdMGLC
 poi+UuDQ/EWWV6JAXccSZN4uOQwB8/GTJzX6pjPs=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20210901072213eucas1p24c002712599e64af3543d690befb98e1~gocVHDiwI3011130111eucas1p2Q;
 Wed,  1 Sep 2021 07:22:13 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 8E.76.42068.52A2F216; Wed,  1
 Sep 2021 08:22:13 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210901072213eucas1p1efe4f900cbd06f27ecf7821d52d66e23~gocUmCxVs0663406634eucas1p1k;
 Wed,  1 Sep 2021 07:22:13 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210901072213eusmtrp1c474fd908e2a5ddcbf8d6d9262d30c4e~gocUlMKfE2206322063eusmtrp1x;
 Wed,  1 Sep 2021 07:22:13 +0000 (GMT)
X-AuditID: cbfec7f4-c71ff7000002a454-bb-612f2a259fc9
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 74.21.20981.52A2F216; Wed,  1
 Sep 2021 08:22:13 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210901072212eusmtip286395602945bdb3b13fa594a07116756~gocT4-pi_0779207792eusmtip27;
 Wed,  1 Sep 2021 07:22:12 +0000 (GMT)
Subject: Re: [PATCH v2] of: property: fw_devlink: Add support for
 "phy-handle" property
To: Saravana Kannan <saravanak@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 kernel-team@android.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-amlogic@lists.infradead.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <2023d07e-18bb-e129-760a-18b17ff772cd@samsung.com>
Date: Wed, 1 Sep 2021 09:22:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAGETcx-SqTeGdKF=CD9=Ujo2xrWMw3NnimE7zj+d-4HckmaJVQ@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGKsWRmVeSWpSXmKPExsWy7djPc7qqWvqJBh+nqlicv3uI2WL+kXOs
 FjPf/Gez2LFdxGLBbG6Ly7vmsFkc6ou2OLZAzKJ17xF2i65Df9kcuDy27d7G6vH+Riu7x85Z
 d9k9Fmwq9di0qpPNY/OSeo+dOz4zeXzeJBfAEcVlk5Kak1mWWqRvl8CV8XRiD3PBadWKfVMs
 GhgXyHcxcnJICJhI9H3ZwtbFyMUhJLCCUWLVkdksEM4XRonGR9cYIZzPjBIrP/1mh2mZ8rQb
 qmo5o8SpeYegqj4ySlxZ9p0NpEpYIFLi7L69YLaIgJbEpmuPwTqYBVYySdxe/4gFJMEmYCjR
 9bYLrIhXwE5i6uyXzCA2i4CKxMGDh8DWiQokS0x8MokVokZQ4uTMJ0C9HBycAoESV1dYgYSZ
 BeQltr+dwwxhi0vcejKfCWSXhMB/DomZnx6yQZztIvGhaScThC0s8er4Fqh3ZCROT+5hgWho
 ZpR4eG4tO4TTwyhxuWkGI0SVtcSdc7/YQDYzC2hKrN+lDxF2lPjd/pgVJCwhwCdx460gxBF8
 EpO2TWeGCPNKdLQJQVSrScw6vg5u7cELl5gnMCrNQvLZLCTvzELyziyEvQsYWVYxiqeWFuem
 pxYb5aWW6xUn5haX5qXrJefnbmIEJq3T/45/2cG4/NVHvUOMTByMhxglOJiVRHhZH+olCvGm
 JFZWpRblxxeV5qQWH2KU5mBREudN2rImXkggPbEkNTs1tSC1CCbLxMEp1cCksWZJv8WhtndX
 Ow+cPm7DvUu02J19RUiJu7Widk53aprB9Yp9cUFKj/nZbbPZYpOyTga2ThW5HF2UesyI81fN
 pKcMgm/X2+47kL2nfbv07Nt/jTTiHz7lfXdsI6fdh3evNmkb1KxvTjDw4nNXeB4/+f+qWwf+
 cjqcCBSYw/S82e1tqPPSdq1tP+Mdbv98blfiI+N6xjZizrIXJUl6Hwpd/qt21nMoG1W8SQ15
 clFpXeizn4dszKQD+5NWymnx9dczqF8XuvFC3XdG2Tmf+U84lqoXBm28d6/yCm/u5oCDP1cE
 npSyEq2p05bXSefUn9618IP+vGd+8wts9EXCDf9v0Zr+Srflje/7ma7MMkosxRmJhlrMRcWJ
 AGgJ/jrJAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsVy+t/xe7qqWvqJBhcaWSzO3z3EbDH/yDlW
 i5lv/rNZ7NguYrFgNrfF5V1z2CwO9UVbHFsgZtG69wi7Rdehv2wOXB7bdm9j9Xh/o5XdY+es
 u+weCzaVemxa1cnmsXlJvcfOHZ+ZPD5vkgvgiNKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx
 1DM0No+1MjJV0rezSUnNySxLLdK3S9DLeDqxh7ngtGrFvikWDYwL5LsYOTkkBEwkpjztZuli
 5OIQEljKKPHv6y52iISMxMlpDawQtrDEn2tdbBBF7xklZi+ZDVYkLBAp8f3ZSUYQW0RAS2LT
 tccsIDazwEomiZWPyiEazjFL7O/+DDaJTcBQoustyCRODl4BO4mps18yg9gsAioSBw8eAhsq
 KpAs8eH0UlaIGkGJkzOfAA3l4OAUCJS4usIKYr6ZxLzND5khbHmJ7W/nQNniEreezGeawCg0
 C0n3LCQts5C0zELSsoCRZRWjSGppcW56brGRXnFibnFpXrpecn7uJkZgjG479nPLDsaVrz7q
 HWJk4mA8xCjBwawkwsv6UC9RiDclsbIqtSg/vqg0J7X4EKMp0DsTmaVEk/OBSSKvJN7QzMDU
 0MTM0sDU0sxYSZzX5MiaeCGB9MSS1OzU1ILUIpg+Jg5OqQYmdk2r/pf2iWei7Wa91p2ikr17
 ceeR23fiBFe95V1ctMbJuHL2jI9BGaveRTEoR4os8ypld4y6GSK8bMn/xYG+V/8m2eb0zkpg
 XC/7fJGdKEPR7uQZF7g3Z6/Nn/f458myRw2i/w7mbGe/fuT3SoGnZd1rv2+qCazxOs6ecf5u
 z/tT/vfySwU5GDqfCIfM6JFIXLLdg69CN36tD/thiQ7JWfOMjnk8MXmeJS6T6ZG3eItqyrnE
 WuF9ytN3LPzt99Nc8/HkhNbZaR6nDujFbijI/eZ+dd7csiPL4kyinTZZdAlLz5aY4eERdcI3
 9w+jv+/x/72Xq/YmLzn74G08f8hTqdifCjdsnxen3M+f7GCqxFKckWioxVxUnAgAm5c7uloD
 AAA=
X-CMS-MailID: 20210901072213eucas1p1efe4f900cbd06f27ecf7821d52d66e23
X-Msg-Generator: CA
X-RootMTR: 20210823120849eucas1p11d3919886444358472be3edd1c662755
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210823120849eucas1p11d3919886444358472be3edd1c662755
References: <CGME20210823120849eucas1p11d3919886444358472be3edd1c662755@eucas1p1.samsung.com>
 <20210818021717.3268255-1-saravanak@google.com>
 <0a2c4106-7f48-2bb5-048e-8c001a7c3fda@samsung.com>
 <CAGETcx_xJCqOWtwZ9Ee2+0sPGNLM5=F=djtbdYENkAYZa0ynqQ@mail.gmail.com>
 <427ce8cd-977b-03ae-2020-f5ddc7439390@samsung.com>
 <CAGETcx8cRXDciKiRMSb=ybKo8=SyiNyAv=7oeHU1HUhkZ60qmg@mail.gmail.com>
 <CAGETcx-SqTeGdKF=CD9=Ujo2xrWMw3NnimE7zj+d-4HckmaJVQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_002218_915529_148F06E0 
X-CRM114-Status: GOOD (  29.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Saravana,

On 01.09.2021 04:37, Saravana Kannan wrote:
> On Tue, Aug 24, 2021 at 12:31 AM Saravana Kannan <saravanak@google.com> wrote:
>> On Tue, Aug 24, 2021 at 12:03 AM Marek Szyprowski
>> <m.szyprowski@samsung.com> wrote:
>>> On 23.08.2021 20:22, Saravana Kannan wrote:
>>>> On Mon, Aug 23, 2021 at 5:08 AM Marek Szyprowski
>>>> <m.szyprowski@samsung.com> wrote:
>>>>> On 18.08.2021 04:17, Saravana Kannan wrote:
>>>>>> Allows tracking dependencies between Ethernet PHYs and their consumers.
>>>>>>
>>>>>> Cc: Andrew Lunn <andrew@lunn.ch>
>>>>>> Cc: netdev@vger.kernel.org
>>>>>> Signed-off-by: Saravana Kannan <saravanak@google.com>
>>>>> This patch landed recently in linux-next as commit cf4b94c8530d ("of:
>>>>> property: fw_devlink: Add support for "phy-handle" property"). It breaks
>>>>> ethernet operation on my Amlogic-based ARM64 boards: Odroid C4
>>>>> (arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts) and N2
>>>>> (meson-g12b-odroid-n2.dts) as well as Khadas VIM3/VIM3l
>>>>> (meson-g12b-a311d-khadas-vim3.dts and meson-sm1-khadas-vim3l.dts).
>>>>>
>>>>> In case of OdroidC4 I see the following entries in the
>>>>> /sys/kernel/debug/devices_deferred:
>>>>>
>>>>> ff64c000.mdio-multiplexer
>>>>> ff3f0000.ethernet
>>>>>
>>>>> Let me know if there is anything I can check to help debugging this issue.
>>>> I'm fairly certain you are hitting this issue because the PHY device
>>>> doesn't have a compatible property. And so the device link dependency
>>>> is propagated up to the mdio bus. But busses as suppliers aren't good
>>>> because busses never "probe".
>>>>
>>>> PHY seems to be one of those cases where it's okay to have the
>>>> compatible property but also okay to not have it. You can confirm my
>>>> theory by checking for the list of suppliers under
>>>> ff64c000.mdio-multiplexer. You'd see mdio@0 (ext_mdio) and if you look
>>>> at the "status" file under the folder it should be "dormant". If you
>>>> add a compatible property that fits the formats a PHY node can have,
>>>> that should also fix your issue (not the solution though).
>>> Where should I look for the mentioned device links 'status' file?
>>>
>>> # find /sys -name ff64c000.mdio-multiplexer
>>> /sys/devices/platform/soc/ff600000.bus/ff64c000.mdio-multiplexer
>>> /sys/bus/platform/devices/ff64c000.mdio-multiplexer
>>>
>>> # ls -l /sys/devices/platform/soc/ff600000.bus/ff64c000.mdio-multiplexer
>>> total 0
>> This is the folder I wanted you to check.
>>
>>> lrwxrwxrwx 1 root root    0 Jan  1 00:04
>>> consumer:platform:ff3f0000.ethernet ->
>>> ../../../../virtual/devlink/platform:ff64c000.mdio-multiplexer--platform:ff3f0000.ethernet
>> But I should have asked to look for the consumer list and not the
>> supplier list. In any case, we can see that the ethernet is marked as
>> the consumer of the mdio-multiplexer instead of the PHY device. So my
>> hunch seems to be right.
>>
>>> -rw-r--r-- 1 root root 4096 Jan  1 00:04 driver_override
>>> -r--r--r-- 1 root root 4096 Jan  1 00:04 modalias
>>> lrwxrwxrwx 1 root root    0 Jan  1 00:04 of_node ->
>>> ../../../../../firmware/devicetree/base/soc/bus@ff600000/mdio-multiplexer@4c000
>>> drwxr-xr-x 2 root root    0 Jan  1 00:02 power
>>> lrwxrwxrwx 1 root root    0 Jan  1 00:04 subsystem ->
>>> ../../../../../bus/platform
>>> lrwxrwxrwx 1 root root    0 Jan  1 00:04
>>> supplier:platform:ff63c000.system-controller:clock-controller ->
>>> ../../../../virtual/devlink/platform:ff63c000.system-controller:clock-controller--platform:ff64c000.mdio-multiplexer
>>> -rw-r--r-- 1 root root 4096 Jan  1 00:04 uevent
>>> -r--r--r-- 1 root root 4096 Jan  1 00:04 waiting_for_supplier
>>>
>>> # cat
>>> /sys/devices/platform/soc/ff600000.bus/ff64c000.mdio-multiplexer/waiting_for_supplier
>>> 0
>>>
>>> I'm also not sure what compatible string should I add there.
>> It should have been added to external_phy: ethernet-phy@0. But don't
>> worry about it (because you need to use a specific format for the
>> compatible string).
>>
> Marek,
>
> Can you give this a shot?
> https://lore.kernel.org/lkml/20210831224510.703253-1-saravanak@google.com/
>
> This is not the main fix for the case you brought up, but it should
> fix your issue as a side effect of fixing another issue.

I've just checked it and it doesn't help in my case. 
ff64c000.mdio-multiplexer and ff3f0000.ethernet are still not probed 
after applying this patch.

> The main fix for your issue would be to teach fw_devlink that
> phy-handle always points to the actual DT node that'll become a device
> even if it doesn't have a compatible property. I'll send that out
> later.

I'm waiting for the proper fix then.

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
