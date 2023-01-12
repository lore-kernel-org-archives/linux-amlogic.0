Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843B0C61DB3
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Jan 2023 09:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UrB+H8lAzhnX6hM4R9ieEaAYdQUIlZ45i38MWABuA/U=; b=P69yLRlBbIwQVz
	Gy8+UnllE/Y6aeewrD8/eYrmHNxSAwxxkTveioTsTbQYNBdDJODY0Z/RPviJd1NpojNfBQjBJtmgk
	GDdOOztJLE0ECGE85RQpDxOPsKxjAdXfzUcEHp3quUogdfT7LvYje9GJnEfFFC9GUPUeaSLbz/HVJ
	0bp1Btrqm0/rIXHoDqSho6IKDPPKnbBw3e/dRE18OaML0a0nUJ3CdeP9C/FVysBkZVxmjuUueDNv/
	LzmAD6f+a2oo5/3UZBAPSIkCm4tygYzDctiTC0S3qeJ80rKc8gXRYvaim4Z90usIj4va8x44MWb7J
	PXzZdiyosOKksvC1TPDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFu0b-00EOa9-F0; Thu, 12 Jan 2023 09:36:29 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFu0Q-00EOVx-JB
	for linux-amlogic@lists.infradead.org; Thu, 12 Jan 2023 09:36:20 +0000
Received: by mail-lf1-x129.google.com with SMTP id m6so27574809lfj.11
        for <linux-amlogic@lists.infradead.org>; Thu, 12 Jan 2023 01:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U+H4r/exaxLZYtbHsCS7HbU9Fue66yphf1NkdC8hcHo=;
        b=qSO7IRdt41/NKUd9BGQbJxXGJRefyGe7meFWAvTqtCEept3q8Gc06J4ocxl9Fn1hdB
         5hgPB06ZVPHs+/forhCn+wUMCj+qhvl8ahZLQ003EMtjH0xFMnZq8uLHhGRL41UXYy4F
         Pu0FpN5WGdKebtgbsQsaNQhrgmb3eJoiOY8sSmgdkbttNg2bMhGvtCFk8J0/UUcEVscG
         tI51AEsRP0la1E9Wnbd5nSLDGQVtG/xIO5g0LnhgluKwfJyZbdEi94sJ6fvVT57brg2b
         ftcQKljYKKQyp0DX7g0gIGxIlSoEy5uKC4B3uyn5xmXVRJE7iaGyPDRVoNa8mBZ9afH/
         tlFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U+H4r/exaxLZYtbHsCS7HbU9Fue66yphf1NkdC8hcHo=;
        b=x9jDqGz2Ow1SYCSWQ6khXNqS36BHZihLaseH8mNAik+gJe9itC4Md1CtWT1sXstSom
         0mjfT6dM9djBBMwF24JCPbMM2K6DChdQXE8gO6q2cvmd7dMGPEBPo9vuvHmRd+aMrDUY
         SHii8H77+r7lYHI0sNr2ktDeT29pVSGSu5kYn3Fd7/avnMFznPkjXX8Om6nyZpTfM6rx
         6xu8rn7hCvMEdMyFpcs6MKkBoFX6avFD92EMtyQZVvrIzLHzguZ3h8f0EFQG464wyDNZ
         d/lTcNI3CNeiOxJHJC3GcQirt+Odb5BHSbFw3oGQBeHf4DKG4M9cUgHqyblZw8PlgOdZ
         IAFw==
X-Gm-Message-State: AFqh2kraFTS/iB2uxXS/kSISbNapUjrGIvnjyij+DRfLW9XfL77Apx1O
	VBUjiTWisWxKCwhBekRIAfS4Xg==
X-Google-Smtp-Source: AMrXdXt63NWqcBUwOlmjqu+gRqgGqY4uXX5P+HpkI+0qNeAzpgpyJ4OBdtQEEGJABf454vdCAiO/dg==
X-Received: by 2002:a05:6512:6d4:b0:4cb:1e1:f380 with SMTP id u20-20020a05651206d400b004cb01e1f380mr20737798lff.40.1673516172708;
        Thu, 12 Jan 2023 01:36:12 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c28-20020a056512239c00b0049ad2619becsm3171875lfv.131.2023.01.12.01.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 01:36:12 -0800 (PST)
Message-ID: <a11d3c82-1be5-2185-4ff1-48dd54ce9a55@linaro.org>
Date: Thu, 12 Jan 2023 11:36:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [v3,3/7] drm/bridge_connector: rely on drm_kms_helper_poll_* for
 HPD enablement
Content-Language: en-GB
To: neil.armstrong@linaro.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Tomi Valkeinen <tomba@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org
References: <20221102180705.459294-4-dmitry.baryshkov@linaro.org>
 <CGME20230111124140eucas1p21242c8b4cb0fc8a994d66827ca76a3ee@eucas1p2.samsung.com>
 <a3f59ce3-8426-2af0-4663-ee948490d75c@samsung.com>
 <c7a6714c-edcc-fa1c-ff83-2e066c7bbd84@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c7a6714c-edcc-fa1c-ff83-2e066c7bbd84@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_013618_638975_75574E77 
X-CRM114-Status: GOOD (  12.45  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTIvMDEvMjAyMyAxMTozNSwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gT24gMTEvMDEvMjAy
MyAxMzo0MSwgTWFyZWsgU3p5cHJvd3NraSB3cm90ZToKPj4gT24gMDIuMTEuMjAyMiAxOTowNywg
RG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToKPj4+IFVzZSBkcm1fY29ubmVjdG9yJ3MgaGVscGVycyBl
bmFibGVfaHBkIGFuZCBkaXNhYmxlX2hwZCB0byBlbmFibGUgYW5kCj4+PiBkaXNhYmxlIEhQRCBh
dXRvbWF0aWNhbGx5IGJ5IHRoZSBtZWFucyBvZiBkcm1fa21zX2hlbHBlcl9wb2xsXyoKPj4+IGZ1
bmN0aW9ucy4gQXMgdGhlIGRybV9icmlkZ2VfY29ubmVjdG9yX2VuYWJsZV9ocGQoKSBhbmQKPj4+
IGRybV9icmlkZ2VfY29ubmVjdG9yX2Rpc2FibGVfaHBkKCkgZnVuY3Rpb25zIGFyZSBub3cgdW51
c2VkLCByZXBsYWNlCj4+PiB0aGVtIHdpdGggc3R1YnMgdG8gZWFzZSBkcml2ZXIgbWlncmF0aW9u
Lgo+Pj4KPj4+IEVuYWJsaW5nIHRoZSBIUEQgZnJvbSBkcm1fYnJpZGdlX2Nvbm5lY3Rvcl9pbml0
KCkgY2FuIGhhcHBlbiB0b28gZWFybHksCj4+PiBiZWZvcmUgdGhlIGRyaXZlciBpcyBwcmVwYXJl
ZCB0byBoYW5kbGUgSFBEIGV2ZW50cy4gQXMgdGhlCj4+PiBkcm1fYnJpZGdlX2Nvbm5lY3Rvcl9l
bmFibGVfaHBkKCkgaXMgZW1wdHkgYW55d2F5LCBkcm9wIHRoaXMgY2FsbAo+Pj4gYW55d2F5Lgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZA
bGluYXJvLm9yZz4KPj4+IC0tLQo+Pgo+PiBUaGlzIHBhdGNoLCBtZXJnZWQgdG8gcmVjZW50IGxp
bnV4LW5leHQgYXMgY29tbWl0IDkyZDc1NWQ4ZjEzYgo+PiAoImRybS9icmlkZ2VfY29ubmVjdG9y
OiByZWx5IG9uIGRybV9rbXNfaGVscGVyX3BvbGxfKiBmb3IgSFBECj4+IGVuYWJsZW1lbnQiKSwg
dHJpZ2dlcnMgdGhlIGZvbGxvd2luZyB3YXJuaW5nIG9uIGFsbCBteSBBbWxvZ2ljIE1lc29uCj4+
IGJhc2VkIGJvYXJkczoKPj4KPj4gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0t
Cj4+IEhvdCBwbHVnIGRldGVjdGlvbiBhbHJlYWR5IGVuYWJsZWQKPj4gV0FSTklORzogQ1BVOiAy
IFBJRDogMjg1IGF0IGRyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmM6MTI1Nwo+PiBkcm1fYnJp
ZGdlX2hwZF9lbmFibGUrMHg5MC8weGEwCj4+IE1vZHVsZXMgbGlua2VkIGluOiBzbmRfc29jX21l
c29uX2F4Z19mcmRkciBzbmRfc29jX21lc29uX2F4Z19maWZvCj4+IGR3bWFjX2dlbmVyaWMgcGFu
ZnJvc3QoKykgcmVzZXRfbWVzb25fYXVkaW9fYXJiKCspIGRybV9zaG1lbV9oZWxwZXIKPj4gbWVz
b25fZHdfaGRtaSgrKSBkd19oZG1pIHJjX29kcm9pZCBkcm1fZGlzcGxheV9oZWxwZXIgbWVzb25f
aXIoKykKPj4gZ3B1X3NjaGVkIG1lc29uX3JuZyBybmdfY29yZSBtZXNvbl9neGJiX3dkdCBjcmN0
MTBkaWZfY2UgZHdtYWNfbWVzb244Ygo+PiBzdG1tYWNfcGxhdGZvcm0gc25kX3NvY19tZXNvbl9h
eGdfc291bmRfY2FyZCBzbmRfc29jX21lc29uX2NhcmRfdXRpbHMKPj4gbWRpb19tdXhfbWVzb25f
ZzEyYSBzdG1tYWMgbWVzb25fZHJtIHB3bV9tZXNvbiBwY3NfeHBjcyBtZXNvbl9jYW52YXMKPj4g
c25kX3NvY19tZXNvbl9heGdfdGRtX2ludGVyZmFjZSBydGNfbWVzb25fdnJ0Ywo+PiBzbmRfc29j
X21lc29uX2F4Z190ZG1fZm9ybWF0dGVyIG52bWVtX21lc29uX2VmdXNlIGRpc3BsYXlfY29ubmVj
dG9yCj4+IENQVTogMiBQSUQ6IDI4NSBDb21tOiBzeXN0ZW1kLXVkZXZkIE5vdCB0YWludGVkIDYu
MS4wLXJjNisgIzEzMjM2Cj4+IEhhcmR3YXJlIG5hbWU6IEhhcmRrZXJuZWwgT0RST0lELUM0IChE
VCkKPj4gcHN0YXRlOiA2MDQwMDAwOSAoblpDdiBkYWlmICtQQU4gLVVBTyAtVENPIC1ESVQgLVNT
QlMgQlRZUEU9LS0pCj4+IHBjIDogZHJtX2JyaWRnZV9ocGRfZW5hYmxlKzB4OTAvMHhhMAo+PiBs
ciA6IGRybV9icmlkZ2VfaHBkX2VuYWJsZSsweDkwLzB4YTAKPj4gLi4uCj4+IENhbGwgdHJhY2U6
Cj4+IMKgIMKgZHJtX2JyaWRnZV9ocGRfZW5hYmxlKzB4OTAvMHhhMAo+PiDCoCDCoF9kcm1fYnJp
ZGdlX2Nvbm5lY3Rvcl9lbmFibGVfaHBkKzB4MjQvMHgzNAo+IAo+IFdlaXJkIGJlY2F1c2UgX2Ry
bV9icmlkZ2VfY29ubmVjdG9yX2VuYWJsZV9ocGQoKSBoYXMgYmVlbiByZW1vdmVkIHdpdGgKPiA0
YzAwYWM1MDBkMGUgKCJkcm0vYnJpZGdlX2Nvbm5lY3RvcjogZHJvcCAKPiBkcm1fYnJpZGdlX2Nv
bm5lY3Rvcl9lbi9kaXNhYmxlX2hwZCgpIikKPiAKPiAKPj4gwqAgwqBkcm1fa21zX2hlbHBlcl9w
b2xsX2VuYWJsZS5wYXJ0LjArMHg1MC8weGQwCj4gCj4gSXQgc2VlbXMgZHJtX2ttc19oZWxwZXJf
cG9sbF9lbmFibGUgaXMgY2FsbGVkIGFnYWluIGJ5Cj4gZHJtX2hlbHBlcl9wcm9iZV9zaW5nbGVf
Y29ubmVjdG9yX21vZGVzKCkgYmVjYXVzZSBwb2xsX3J1bm5pbmcgaXNuJ3Qgc2V0LgoKWWVzLCBJ
J20gY3VycmVudGx5IHJld29ya2luZyBwb2xsX3J1bm5pbmcgaGFuZGxpbmcuIEkgaG9wZSB0byBw
b3N0IGEgCnBhdGNoIHRvZGF5LgoKLS0gCldpdGggYmVzdCB3aXNoZXMKRG1pdHJ5CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
