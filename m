Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60103C369A6
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Apr 2025 14:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mH0WoY/oK0TMo65BY2jWDKZEI6kCD/tMM6ILVcXgfvw=; b=HWpcnka4sZmWGm
	1VUuzfvkX8XJv71N+/f/bpgGfnyINQcIsqlePcU0i1DeYXtMP3Ui+fp/yqjQgE7MdC84vmfOXDbKl
	GB2ywwwF3DZt1Pgg9E4HIkL9eVBcMP0GoZKYswhJRu6amGFLKxTEG4kimh2eVC2YIwjAC7XNIrrp9
	88N4gr/ob+oZjwdtfv4BYMSmUkfsJQE6XpZ3aLr6k4QlgnCnEoG40nsFEnVpbvSJsNaKsTXHqjbUp
	llXA0s8WuLBw1htwXqYDszTH5rqvJ1i2qmXnUGk60T6igy+k5g2im9XnxxsfNf1YVGdqKyK1NisLo
	WXdJd2gmkcSQmnDqdS+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sg6-0000000Ao4x-2r6P;
	Thu, 10 Apr 2025 14:14:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sg1-0000000Ao2C-3sGP
	for linux-amlogic@lists.infradead.org;
	Thu, 10 Apr 2025 14:14:49 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75dXe018998
	for <linux-amlogic@lists.infradead.org>; Thu, 10 Apr 2025 14:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lce32oQFI++V3gENrPxZvYwnMyyQQciO4ddTSjTvVl0=; b=lDYgMBzwKpT1YVaz
	xm0sOkM7l45gCSzaGWlGsWQnVNvhsMVEU9EzjnmJj1GrlO9lLX75+txKmnnR8yvV
	QPdmMrqOnyFsDGZIlfXpmHXNdNwHE1n6o1hktO31mN14OXVRmgmmK2WdgBmX1Dx9
	zLFK4xH+COoRGZSbxMt4J6eIIUcCPukrfRadomkV6e2djegPrX1wfA1CBKmjTQuP
	dlWbK7VHTrWR+wYMHZqZwKiNVMRhTvfesH9nmQ54G+DzhCMIife+5uaqxTk0tFyb
	Y996FvTZfPMiI6+gM89KPLnbW1SzU5fH7mQQU8AvfgGR52P7bLsjetfOnWpO7bwR
	jFZ0Vg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgq9n2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Thu, 10 Apr 2025 14:14:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c790dc38b4so153756085a.0
        for <linux-amlogic@lists.infradead.org>; Thu, 10 Apr 2025 07:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744294483; x=1744899283;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lce32oQFI++V3gENrPxZvYwnMyyQQciO4ddTSjTvVl0=;
        b=adgvLtumxoaH8e+4fnFWd9Umh5CstqqNA+y5fKZfvQHWQ2niBwNUCU5YdLnzMHLoEC
         2phfi9fLHY/Wf+4p95c8Ec/lVdelFIYWIkz5to66SgsN3rLV14DYzDhc9K6MsK99x65x
         2Hqe6U884fYxOUo5jSYTdX+k5WQk2Mozf5iwbV+woe8qjOVOhX7w7hYtT9ACTTyqdDbz
         yqYoyh/ZzTKO6quWdaN07IuIhT4H9n6nsbaT47gbKCtBWuUBjurJFI1utGrjgViv7qNZ
         t/YHBIz6nEZXUmem1V+Y+6H0Golovvzk2NOItBO+6BJvMt8HboLK9bjHfyns5i/SSwCL
         NNmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMva1IkWfeC1lvNA2bFHcxe+SwKM/OnmIKVKlLORCBUklV59RnKa6pXpLNuI8ZuXnaFX/w/OkRkicppxUO@lists.infradead.org
X-Gm-Message-State: AOJu0YwNHST1phpi+HIAAJEniOz/OPjbw+qJOGCKx3IzWF5eZ5dfGmQZ
	16j700nXDNx9VpurS49cw5r7wBV3mkvuEYkNFQ1yejiO9ThNX9ZyHy9ej44JchwpHwO3BeVEPW/
	xVmrYkb2D0UYTZNhcuCgZqXuxv9aRAz9tHyzp5+zLP3UD6GrhmHyOM2XS+wnaRFcsyZyJww==
X-Gm-Gg: ASbGncsuKpK4aF0Wa9lIH/LRN+/xtpX5hAlikbd5qnZX80HsP1Fzqor4VfkLIcBIZ/h
	ysy4Oo5Gwqnxmqpq8m/IhLQFNNchPXsRcVRmp87JI72x+pB7iv7JmqHd/tX/tdtfVj7sUEE1z9y
	Fe68+ghipm+wejtcFEqw5qRo4EkQY54efYELxbrGbg7mk8fLjSmc0FM1TW3ULxl3LLzucUBqta7
	uz+NHDl0C99L1iULjOZeBd1w19NNKwghzywiE693Suk0PGdTkYTOgNlUpuqRWSeMMZNlosLA3GQ
	O13iiEmwxQqwHa+YBSyesgMtUtv3aDzaAz3osgsXpAx7oo5NE3UDQGTHux/4QWeuUqEp63n2qK0
	=
X-Received: by 2002:a05:620a:4712:b0:7c5:a542:10a with SMTP id af79cd13be357-7c7a76604bamr427411485a.10.1744294483367;
        Thu, 10 Apr 2025 07:14:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlKeQtmurcUxSJLFNFsvzgIOZksryqV0lZXDe/Ak1oGKqZ5es+suN57szXtRFNrahXiCUAjg==
X-Received: by 2002:a05:620a:4712:b0:7c5:a542:10a with SMTP id af79cd13be357-7c7a76604bamr427403385a.10.1744294482871;
        Thu, 10 Apr 2025 07:14:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465d4ebbsm5156621fa.73.2025.04.10.07.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 07:14:42 -0700 (PDT)
Date: Thu, 10 Apr 2025 17:14:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        Conor Dooley <conor@kernel.org>, linux-rockchip@lists.infradead.org,
        Daniel Machon <daniel.machon@microchip.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, UNGLinuxDriver@microchip.com,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>, linux-sunxi@lists.linux.dev,
        Liviu Dudau <liviu.dudau@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-renesas-soc@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Viresh Kumar <vireshk@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        zhouyanjie@wanyeetech.com, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Heiko Stuebner <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>, linux-pm@vger.kernel.org,
        linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
        linux-mips@vger.kernel.org, imx@lists.linux.dev,
        Samuel Holland <samuel@sholland.org>,
        Sudeep Holla <sudeep.holla@arm.com>, Nishanth Menon <nm@ti.com>,
        devicetree@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-arm-msm@vger.kernel.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-amlogic@lists.infradead.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 14/19] dt-bindings: arm/cpus: Add schemas for
 "enable-method" dependencies
Message-ID: <nmqw3wbmltbji4cwtifjbxkfm4uprwqvp2vdovnzueay7r26ml@eimrqf54mb34>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-14-076be7171a85@kernel.org>
 <174377856145.1313232.11316769002552655294.robh@kernel.org>
 <CAL_JsqKiduJBRBuRS364_bSjEfC_cvgyicZX1BwvNyb1+GVc3w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqKiduJBRBuRS364_bSjEfC_cvgyicZX1BwvNyb1+GVc3w@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f7d254 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=lInoRNGhrZE9hIAi3NoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: edyKE7d9s0lTgZg2YNKMiSGQG5e9GSbm
X-Proofpoint-GUID: edyKE7d9s0lTgZg2YNKMiSGQG5e9GSbm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_03,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=676 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_071446_135558_931D6EBC 
X-CRM114-Status: GOOD (  19.40  )
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

T24gVGh1LCBBcHIgMTAsIDIwMjUgYXQgMDk6MTE6MjJBTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gRnJpLCBBcHIgNCwgMjAyNSBhdCA5OjU24oCvQU0gUm9iIEhlcnJpbmcgKEFybSkg
PHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4KPiA+IE9uIFRodSwgMDMgQXByIDIwMjUg
MjE6NTk6MzUgLTA1MDAsIFJvYiBIZXJyaW5nIChBcm0pIHdyb3RlOgo+ID4gPiBSZXBsYWNlIHRo
ZSBwcm9zZSBmb3IgcHJvcGVydGllcyBkZXBlbmRlbnQgb24gc3BlY2lmaWMgImVuYWJsZS1tZXRo
b2QiCj4gPiA+IHZhbHVlcyB3aXRoIHNjaGVtYXMgZGVmaW5pbmcgdGhlIHNhbWUgcmVxdWlyZW1l
bnRzLgo+ID4gPgo+ID4gPiBCb3RoICJxY29tLGFjYyIgYW5kICJxY29tLHNhdyIgcHJvcGVydGll
cyBhcHBlYXIgdG8gYmUgcmVxdWlyZWQgZm9yIGFueQo+ID4gPiBvZiB0aGUgUXVhbGNvbW0gZW5h
YmxlLW1ldGhvZCB2YWx1ZXMsIHNvIHRoZSBzY2hlbWEgaXMgYSBiaXQgc2ltcGxlcgo+ID4gPiB0
aGFuIHdoYXQgdGhlIHRleHQgc2FpZC4gVGhlIHJlZmVyZW5jZXMgdG8gYXJtL21zbS9xY29tLHNh
dzIudHh0IGFuZAo+ID4gPiBhcm0vbXNtL3Fjb20sa3Bzcy1hY2MudHh0IGFyZSBvdXQgb2YgZGF0
ZSwgc28ganVzdCBkcm9wIHRoZW0uCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJy
aW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9jcHVzLnlhbWwgfCA4MiArKysrKysrKysrKysrKyst
LS0tLS0tLS0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKSwgMzMgZGVs
ZXRpb25zKC0pCj4gPiA+Cj4gPgo+ID4gTXkgYm90IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtl
IGR0X2JpbmRpbmdfY2hlY2snIG9uIHlvdXIgcGF0Y2g6Cj4gPgo+ID4geWFtbGxpbnQgd2Fybmlu
Z3MvZXJyb3JzOgo+ID4KPiA+IGR0c2NoZW1hL2R0YyB3YXJuaW5ncy9lcnJvcnM6Cj4gPiAvYnVp
bGRzL3JvYmhlcnJpbmcvZHQtcmV2aWV3LWNpL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zb2MvcWNvbS9xY29tLHNhdzIuZXhhbXBsZS5kdGI6IGNwdUAwOiAncWNvbSxh
Y2MnIGlzIGEgcmVxdWlyZWQgcHJvcGVydHkKPiA+ICAgICAgICAgZnJvbSBzY2hlbWEgJGlkOiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9hcm0vY3B1cy55YW1sIwo+IAo+IEFueSBRY29t
IGZvbGtzIHdhbnQgdG8gdGVsbCBtZSB3aGV0aGVyIGJvdGggcWNvbSxhY2MgYW5kIHFjb20sc2F3
IGFyZQo+IHJlcXVpcmVkIG9yIG5vdD8gQWxsIHRoZSBhY3R1YWwgdXNlcnMgaGF2ZSBib3RoLgoK
WWVzLCBhcyBmYXIgYXMgSSByZW1lbWJlci4KCi0tIApXaXRoIGJlc3Qgd2lzaGVzCkRtaXRyeQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
