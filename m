Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA586E77188
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jan 2025 20:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:To:From:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kEqEgimEekvxjBsOGpWvvYGy3+Fx7mU8OBdVOFD1jpQ=; b=ee7WSEbFa8/MsA
	pqzrkSaQBQVWBDEc0xNUQ/udP/8KlwXf4h/qfNMn0BzeHPL2ZdVAPS9nxj1U6oTQGHVDrqoQ2sujB
	3tYZGzJgFdZE5bJevn08Z+NuNBJ/kTdweRE/wj9+oiuLk9qgf7Z0hVWYOimvCASwZxn1u1akY9Sf1
	YMsjCOTmDN2b7SpJHQrqnmiCZO3ntA23KHRPHccLDiBBF3l2Zo10ZGq7IKDjsNnIRAwbU0z2JmhrE
	WeYIEBBn0gIBGGTJ75HF3lSQREzpIkkFoN61jsvCNwwpLZArNM2vsT+NXXsQ1aJu4QvPQaCsd3tRV
	u+/75hvtpc6Sa+bjCKtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTRNi-0000000BLTo-1arT;
	Thu, 02 Jan 2025 20:01:22 +0000
Received: from [203.138.198.214] (helo=mail0.sakrgroupholding.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTRNd-0000000BLRF-195T
	for linux-amlogic@lists.infradead.org;
	Thu, 02 Jan 2025 20:01:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default; d=sakrgroupholding.com;
 h=Message-ID:Sender:From:To:Subject:Date:MIME-Version:Content-Type:
 Content-Transfer-Encoding; i=sendonly@sakrgroupholding.com;
 bh=6S6TQDhHnPX3O7L+G+uDU6ZARIUARi+UXbHIx8WIGzM=;
 b=rPZbfTIx83tH30MJmoU2B+kuqsRyt0x8cHxh5b8WuvgpFWxzic0Rfg7+lfegu3hEWDORxnkzJ+i/
   ciyOz3seelP3eJIGnsFJUT9yhf1mKF6K0Vg+KGSrWkNvBwKqkqTU402bv+GXrUsDAIq6vITMePRh
   MZiEanWMFq7uybQsQk4=
Message-ID: <ecb4afcfe131150f07d4da3f3b5f3bfe@d-publishing.jp>
From: =?utf-8?B?77yq77yh44ON44OD44OI44OQ44Oz44Kv?= <support@d-publishing.jp>
To: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
Subject: =?utf-8?B?44CQ57eK5oCl5oOF5aCx44CR44GK5a6i44GV44G+5oOF5aCx?=
	=?utf-8?B?44O75Y+W5byV55uu55qE44Gu56K66KqN?=
Date: Thu, 02 Jan 2025 19:51:05 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_120117_745300_F4FE6672 
X-CRM114-Status: UNSURE (   0.57  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

44GE44Gk44KC77yq77yh44ON44OD44OI44OQ44Oz44Kv44KS44GU5Yip55So44GE44Gf44Gg44GN
44GC44KK44GM44Go44GG44GU44GW44GE44G+44GZ44CCCgrvvKrvvKHjg5Djg7Pjgq/jgafjga/j
gIHjgYrlrqLjgZXjgb7jgavlronlv4PlronlhajjgavjgYrlj5blvJXjgYTjgZ/jgaDjgZHjgovj
gojjgYbjgIHjg57jg43jg7zjg7vjg63jg7zjg7Pjg4Djg6rjg7PjgrDjgYrjgojjgbPjg4bjg63o
s4fph5HkvpvkuI7pmLLmraLlr77nrZbjgavlj5bjgorntYTjgpPjgafjgYrjgorjgIHjgZ3jga7k
uIDnkrDjgajjgZfjgabjgIHlrprmnJ/nmoTjgavjgYrlrqIK44GV44G+5oOF5aCx44O75Y+W5byV
55uu55qE562J44Gu56K66KqN44KS6KGM44Gj44Gm44GK44KK44G+44GZ44CCCuOBiuaJi+aVsOOC
kuOBiuOBi+OBkeOBhOOBn+OBl+OBvuOBmeOBjOOAgeOBlOeQhuino+OBruOBhuOBiOOBlOWbnuet
lOOBruOBu+OBqeOBiumhmOOBhOOBhOOBn+OBl+OBvuOBmeOAggoK5LiL6KiY44Gu44GK5Y+W5byV
56K66KqN44Oc44K/44Oz44KS44Kv44Oq44OD44Kv44GZ44KL44GoIOOAjCDjgYrlrqLjgZXjgb7m
g4XloLHjg7vlj5blvJXnm67nmoTjga7norroqo0g44CNIArjga7nlLvpnaLjgYzooajnpLrjgZXj
gozjgb7jgZnjgILnlLvpnaLjga7moYjlhoXjgavmsr/jgaPjgabjgYrlrqLjgZXjgb7mg4XloLHn
rYnjga7norroqo3jgajjgZTlpInmm7Tjga7mnInnhKHjgIHlj5blvJXnm67nmoTjgpLjgZTlm57n
rZTjgY/jgaDjgZXjgYTjgILnorroqo3kuovpoIXjga7lpInmm7TjgoTmlrDjgZ/jgarmm7jpoZ7m
j5Dlh7rnrYnjgYzjgarjgYTloLTlkIjjgIEx5YiG56iLCuW6puOBp+WujOS6huOBl+OBvuOBmeOA
ggoK4pa844GK5Y+W5byV56K66KqNCmh0dHBzOi8vY2hpbmFoZGp0LmNvbS9pbmRiZXJnLmh0bWwK
CuOAkOOBlOazqOaEj+OAkQrigLvlm57nrZTjgYzlrozkuobjgZfjgb7jgZnjgajjgIHpgJrluLjj
ganjgYrjgorjg63jgrDjgqTjg7Plvozjga7jgYrmiYvntprjgY3jgYzlj6/og73jgavjgarjgorj
gb7jgZnjgIIK4oC75LiA5a6a5pyf6ZaT44GU56K66KqN44GE44Gf44Gg44GR44Gq44GE5aC05ZCI
44CB5Y+j5bqn5Y+W5byV44KS5Yi26ZmQ44GV44Gb44Gm44GE44Gf44Gg44GN44G+44GZ44CCCgrj
gYrmiYvmlbDjgpLjgYrjgYvjgZHjgYTjgZ/jgZfjgb7jgZnjgYzjgIHjgZTnkIbop6Pjga7jgYbj
gYjjgZTlm57nrZTjga7jgbvjganjgYrpoZjjgYTjgYTjgZ/jgZfjgb7jgZnjgIIK77yN77yN77yN
77yN77yN77yN77yN77yN77yN77yN77yN77yN77yN77yN77yN77yN77yN77yN77yN77yN77yN77yN
77yN77yN77yN77yN77yN77yNCuOBlOS4jeaYjuOBqueCueOBjOOBlOOBluOBhOOBvuOBl+OBn+OC
ieOAgeS4i+iomOOBvuOBp+OBlOmAo+e1oeOBj+OBoOOBleOBhOOAggrpgKPntaHlhYggMDEyMC0w
NTgtMDk4CuOBk+OCjOOBi+OCieOCgu+8qu+8oeODkOODs+OCr+OCkuOCiOOCjeOBl+OBj+OBiumh
mOOBhOOBl+OBvuOBmeOAggoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
